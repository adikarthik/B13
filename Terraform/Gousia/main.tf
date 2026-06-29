resource "azurerm_resource_group" "rg" {
name = "my_rg"
location = "centralindia"
}



resource "azurerm_virtual_network" "vnet" {
resource_group_name = var.rg_name
name = var.name
location = var.location
address_space = var.address_space 
}



resource "azurerm_subnet" "subnet" {
name = var.subnet_name
resource_group_name = var.rg_name
virtual_network_name = var.vnet_name
address_prefixes = var.address_prefixes
}
