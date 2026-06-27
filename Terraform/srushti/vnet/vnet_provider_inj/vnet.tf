resource "azurerm_virtual_network" "vnet" {
  resource_group_name = data.azurerm_resource_group.rg.name
  name                = "vnet"
  location            = data.azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/24"]
}
