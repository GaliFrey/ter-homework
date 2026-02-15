### vm_db

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона ВМ"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Идентификатор образа"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Идентификатор платформы"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "vCPU ВМ"
}
variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "RAM ВМ"
}

variable "vm_db_core_frac" {
  type        = number
  default     = 20
  description = "Гарантированная доля vCPU ВМ"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}

variable "vm_db_network_nat" {
  type        = bool
  default     = true
  description = "Использовать NAT"
}

variable "vm_db_serial_port_enable" {
  type        = number
  default     = 1
  description = "Активировать серийный порт"
}