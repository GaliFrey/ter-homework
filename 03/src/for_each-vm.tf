#считываем данные об образе ОС
data "yandex_compute_image" "db_image" {
  family = var.vm_db_image_family
}

#создаем ВМ
resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name = "${var.vm_db_prefix_name}-${each.value.vm_name}"

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = var.vm_db_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.db_image.image_id
      size     = each.value.disk_volume
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_db_nat
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  metadata = {
    ssh-keys = local.ssh_public_key
  }
}
