output "network_id" {
  value = yandex_vpc_network.develop.id
}

output "subnet_ids" {
  value = [for subnet in yandex_vpc_subnet.develop : subnet.id]
}