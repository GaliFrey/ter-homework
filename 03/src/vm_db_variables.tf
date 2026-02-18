variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))

  # пример значений (можно вынести в terraform.tfvars)
  default = [
    {
      vm_name     = "main"
      cpu         = 4
      ram         = 8
      disk_volume = 50
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 4
      disk_volume = 30
    }
  ]
}

variable "vm_db_image_family" {
  type = string
  default = "ubuntu-2404-lts-oslogin"
  description = "Образ ОС"
}

variable "vm_db_prefix_name" {
  type = string
  default = "netology-develop-platform-db"
  description = "Префикс имени ВМ"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Доля CPU"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Включить NAT"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}
