variable "env_name" {
  type        = string
  description = "Environment name (e.g., production, develop)"
}

variable "subnets" {
  type = list(object({
    zone = string
    cidr = string
  }))
  description = "List of subnets with zone and CIDR block"
}