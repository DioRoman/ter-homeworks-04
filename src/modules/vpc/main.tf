resource "yandex_vpc_network" "vpc" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "vpc" {
  name           = "${var.network_name}-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.v4_cidr_blocks
}