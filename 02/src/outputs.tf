output "vm_info" {
  description = "instance_name, external_ip, fqdn для каждой из ВМ"
  value = {
    platform_web = {
      instance_name = yandex_compute_instance.platform_web.name
      external_ip   = yandex_compute_instance.platform_web.network_interface[0].nat_ip_address
      fqdn          = yandex_compute_instance.platform_web.fqdn
    }
    platform_db = {
      instance_name = yandex_compute_instance.platform_db.name
      external_ip   = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
      fqdn          = yandex_compute_instance.platform_db.fqdn
    }
  }
}