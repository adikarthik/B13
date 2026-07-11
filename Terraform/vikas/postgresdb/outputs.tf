output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "postgres_server_name" {
  value = azurerm_postgresql_flexible_server.postgres.name
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.database.name
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}
