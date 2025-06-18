resource "yandex_mdb_mysql_cluster" "mysql" {
  name        = var.cluster_name
  network_id  = var.network_id
  environment = "PRODUCTION"
  version     = var.mysql_version

  resources {
    resource_preset_id = var.resource_preset_id
    disk_type_id       = var.disk_type
    disk_size          = var.disk_size
  }

  dynamic "host" {
    for_each = var.ha ? [1, 2] : [1]
    content {
      zone      = var.zones[host.key % length(var.zones)]
      subnet_id = var.subnet_ids[host.key % length(var.subnet_ids)]
    }
  }

  database {
    name = var.database_name
  }

  user {
    name     = var.user_name
    password = var.user_password
    permission {
      database_name = var.database_name
      roles         = ["ALL"]
    }
  }
}