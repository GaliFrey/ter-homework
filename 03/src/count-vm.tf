#считываем данные об образе ОС
data "yandex_compute_image" "web_image" {
  family = var.vm_web_image_family
}

#создаем ВМ
resource "yandex_compute_instance" "web" {
  depends_on = [yandex_compute_instance.db]
  count = 2
  name = "${var.vm_web_prefix_name}-${count.index + 1}"

  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.web_image.image_id
      size     = var.vm_web_disk_size
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  metadata = {
    ssh-keys = local.ssh_public_key
  }
}