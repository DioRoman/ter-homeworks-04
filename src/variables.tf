###cloud vars
variable "cloud_id" {
  type        = string
  default     = "b1g2uh898q9ekgq43tfq"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g22qi1cc8rq4avqgik"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr_a" {
  type        = string
  default     = "10.0.1.0/24"
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_b" {
  type        = string
  default     = "10.0.2.0/24"
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "vpc_subnet_name_a" {
  type        = string
  default     = "develop-ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_b" {
  type        = string
  default     = "develop-ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "ssh-keygen -t ed25519"
}