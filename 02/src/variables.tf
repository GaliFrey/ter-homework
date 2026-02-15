###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gseibtsnsdce94kftf"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gjtgthu82vhe79q1uv"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN5yIIHkmPmdqtgG0rNRrnLZ2L1ebC9pmu66PvcBdpP5 heimdall@Heimdall"
  description = "ssh-keygen -t ed25519"
}

### vm_web

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Идентификатор образа"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя ВМ"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Идентификатор платформы"
}

variable "vm_web_cores" {
  type = number
  default = 2
  description = "vCPU ВМ"
}
variable "vm_web_memory" {
  type = number
  default = 2
  description = "RAM ВМ"
}

variable "vm_web_core_frac" {
  type = number
  default = 20
  description = "Гарантированная доля vCPU ВМ"
}

variable "vm_web_preemptible" {
  type = bool
  default = true
  description = "Прерываемая ВМ"
}

variable "vm_web_network_nat" {
  type = bool
  default = true
  description = "Использовать NAT"
}

variable "vm_web_serial_port_enable" {
  type = number
  default = 1
  description = "Активировать серийный порт"
}