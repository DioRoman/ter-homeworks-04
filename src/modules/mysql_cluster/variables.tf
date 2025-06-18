# modules/mysql_cluster/variables.tf
variable "cluster_name" {
  type        = string
  description = "Имя создаваемого кластера MySQL"
}

variable "network_id" {
  type        = string
  description = "ID сети, в которой будет создан кластер"
}

variable "ha" {
  type        = bool
  default     = false
  description = "Флаг включения High Availability (создание 2 хостов)"
}

variable "mysql_version" {
  type        = string
  default     = "8.0"
  description = "Версия MySQL"
}

variable "resource_preset_id" {
  type        = string
  default     = "s2.micro"
  description = "Прессет ресурсов для хостов"
}

variable "disk_type" {
  type        = string
  default     = "network-ssd"
  description = "Тип диска"
}

variable "disk_size" {
  type        = number
  default     = 16
  description = "Размер диска в GB"
}

variable "zones" {
  type        = list(string)
  default     = ["ru-central1-a", "ru-central1-b"]
  description = "Зоны доступности для размещения хостов"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Список ID подсетей для размещения хостов"
}

variable "database_name" {
  type        = string
  default     = "db"
  description = "Имя создаваемой БД"
}

variable "user_name" {
  type        = string
  default     = "user"
  description = "Имя пользователя БД"
}

variable "user_password" {
  type        = string
  sensitive   = true
  description = "Пароль пользователя БД"
}