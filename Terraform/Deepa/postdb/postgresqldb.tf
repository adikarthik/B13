resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = var.postgresql_server_name
  resource_group_name = azurerm_resource_group.demq.name
  location            = azurerm_resource_group.demq.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  version    = var.postgresql_version
  storage_mb = var.storage_mb
  sku_name   = var.sku_name
  zone       = var.zone

  backup_retention_days = 7
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.postgres.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
