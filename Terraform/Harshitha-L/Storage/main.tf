data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
resource "random_string" "storage_suffix" {
  length  = 6
  upper   = false
  special = false
}
resource "azurerm_storage_account" "storage" {

  name = "storage${random_string.storage_suffix.result}"

  resource_group_name = data.azurerm_resource_group.rg.name

  location = data.azurerm_resource_group.rg.location

  account_tier = "Standard"

  account_replication_type = "LRS"

}
