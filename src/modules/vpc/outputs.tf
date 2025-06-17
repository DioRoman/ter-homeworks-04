output "network_id" {
  description = "ID созданной сети"
  value       = yandex_vpc_network.vpc.id
}

output "subnet_id" {
  description = "ID созданной подсети"
  value       = yandex_vpc_subnet.vpc.id
}