data "azurerm_resource_group" "rg" {
  name = var.rg_name
}
resource "azurerm_storage_account" "storage" {
  name                     = "sanjustorage12"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-demo"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]

}
resource "azurerm_public_ip" "ip" {
  name                = "ip-sanju"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
