resource "azurerm_virtual_network" "vnet" {
  resource_group_name = var.rg_name
  name                = var.vnet_name
  location            = var.location
  address_space       = var.address_space
}