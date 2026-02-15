resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop_web" {
  name           = var.vpc_web_name
  zone           = var.vpc_web_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_web_default_cidr
}

resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vpc_db_name
  zone           = var.vpc_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_db_default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
resource "yandex_compute_instance" "platform_web" {
  # name        = var.vm_web_name
  name        = local.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = var.vm_web_network_nat
  }

  metadata = {
    serial-port-enable = var.vm_web_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "platform_db" {
  # name        = var.vm_db_name
  name        = local.vm_db_name
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_zone
  resources {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_network_nat
  }

  metadata = {
    serial-port-enable = var.vm_db_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}