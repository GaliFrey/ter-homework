module "vpc_dev" {
  source   = "./vpc"
  env_name = var.vpc_name
  zone     = var.default_zone
  cidr     = var.default_cidr[0]
}

data "template_file" "cloud_init_marketing" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file(pathexpand(var.ssh_key_path))
  }
}

data "template_file" "cloud_init_analytics" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file(pathexpand(var.ssh_key_path))
  }
}

module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "marketing"
  instance_count = 1
  image_family   = var.vm_image_family
  public_ip      = true

  labels = { 
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloud_init_marketing.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop" 
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "analytics"
  instance_count = 1
  image_family   = var.vm_image_family
  public_ip      = true

  labels = { 
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloud_init_analytics.rendered
    serial-port-enable = 1
  }
}