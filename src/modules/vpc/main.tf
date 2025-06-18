terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "yandex_vpc_network" "develop" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "develop" {
  for_each       = { for subnet in var.subnets : "${subnet.zone}_${subnet.cidr}" => subnet }
  name           = "${var.env_name}-${each.value.zone}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value.cidr]
}