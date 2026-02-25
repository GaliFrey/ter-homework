# для дисков
variable "vm_storage_disk_count" {
  type        = number
  default     = 3
  description = "Количество дисков"
}

variable "vm_storage_disk_prefix_name" {
  type        = string
  default     = "storage-disk"
  description = "Префикс имени ВМ"
}

variable "vm_storage_disk_size" {
  type        = number
  default     = 1
  description = "Размер диска"
}

# для ВМ 
variable "vm_storage_image_family" {
  type        = string
  default     = "ubuntu-2404-lts-oslogin"
  description = "Образ ОС"
}

variable "vm_storage_name" {
  type        = string
  default     = "netology-develop-platform-storage"
  description = "Префикс имени ВМ"
}

variable "vm_storage_cores" {
  type        = number
  default     = 2
  description = "CPU"
}

variable "vm_storage_memory" {
  type        = number
  default     = 2
  description = "RAM"
}

variable "vm_storage_core_fraction" {
  type        = number
  default     = 20
  description = "Доля CPU"
}

variable "vm_storage_size" {
  type        = number
  default     = 10
  description = "Размер диска"
}

variable "vm_storage_nat" {
  type        = bool
  default     = true
  description = "Включить NAT"
}

variable "vm_storage_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}