resource "azurerm_resource_group" "vdstest" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "vdstest" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.vdstest.name
  location                 = azurerm_resource_group.vdstest.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = var.environment
  }
}