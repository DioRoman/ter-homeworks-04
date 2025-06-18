output "cluster_id" {
  value = yandex_mdb_mysql_cluster.mysql.id
}

output "hosts" {
  value = yandex_mdb_mysql_cluster.mysql.host
}

output "fqdn" {
  value = yandex_mdb_mysql_cluster.mysql.host[0].fqdn
}