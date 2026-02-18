#считываем данные об образе ОС
data "yandex_compute_image" "storage_image" {
  family = var.vm_storage_image_family
}

# создаем диски
resource "yandex_compute_disk" "storage_disk" {
  count = var.vm_storage_disk_count

  name = "${var.vm_storage_disk_prefix_name}-${count.index + 1}"
  size = var.vm_storage_disk_size
  type = "network-hdd"
}

# создаем ВМ
resource "yandex_compute_instance" "storage" {
  name = var.vm_storage_name

  resources {
    cores         = var.vm_storage_cores
    memory        = var.vm_storage_memory
    core_fraction = var.vm_storage_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.storage_image.image_id
      size     = var.vm_storage_size
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_storage_nat
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
    }
  }

  scheduling_policy {
    preemptible = var.vm_storage_preemptible
  }

  metadata = {
    ssh-keys = local.ssh_public_key
  }
}
