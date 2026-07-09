data "azurerm_resource_group" "example" {
  name = "vs_rg"
}
resource "azurerm_storage_account" "storage" {
  name                     = "storageraghavendra01"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
}