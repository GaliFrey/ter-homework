variable "vm_web_image_family" {
  type = string
  default = "ubuntu-2404-lts-oslogin"
  description = "Образ ОС"
}

variable "vm_web_prefix_name" {
  type = string
  default = "netology-develop-platform-web"
  description = "Префикс имени ВМ"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "CPU"
}

variable "vm_web_memory" {
  type        = number
  default     = 2
  description = "RAM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "Доля CPU"
}

variable "vm_web_disk_size" {
  type        = number
  default     = 10
  description = "Размер диска"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Включить NAT"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}