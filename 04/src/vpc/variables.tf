variable "env_name" {
  type        = string
  description = "Имя сети и подсети"
}

variable "zone" {
  type        = string
  description = "Зона доступности, например ru-central1-a"
}

variable "cidr" {
  type        = string
  description = "CIDR подсети, например 10.0.1.0/24"
}