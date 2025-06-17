variable "network_name" {
  description = "Имя создаваемой сети"
  type        = string
}

variable "zone" {
  description = "Зона доступности (например: ru-central1-a)"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR блок для подсети (например: 10.0.0.0/24)"
  type        = list(string)
}