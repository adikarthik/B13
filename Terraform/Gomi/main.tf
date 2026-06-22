resource "azurerm_resource_group" "rg2" {

  name     = var.rg-name
  location = var.rg-location

}

resource "azurerm_network_security_group" "nsgap" {

  name                = var.nsg
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name

}

resource "azurerm_virtual_network" "vnet-app" {

  name                = var.vnet.name
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name
  address_space       = [var.vnet.address_space[0]]

}

resource "azurerm_subnet" "subnets" {

  for_each = var.subnets

  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.vnet-app.name
  resource_group_name  = azurerm_resource_group.rg2.name
  address_prefixes     = each.value.address_prefixes

}

resource "azurerm_network_interface" "nicapp" {

  name                = var.nic.name
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name

  ip_configuration {
    name                          = var.nic.ip_config_name
    subnet_id                     = azurerm_subnet.subnets["subnet1"].id
    private_ip_address_allocation = var.nic.private_ip_allocation

  }
}
