resource "azurerm_resource_group" "rg" {

  name     = var.rg_name
  location = var.rg_location

}

resource "azurerm_network_security_group" "nsg" {

  name                = var.nsg
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_virtual_network" "vnet" {

  name                = var.vnet.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet.address_space

}

resource "azurerm_subnet" "subnets" {

  for_each = var.subnets

  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = each.value.address_prefixes

}

resource "azurerm_storage_account" "storage" {

  name                     = var.storage_account.name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type

}

resource "azurerm_public_ip" "publicip" {

  name                = var.public_ip.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.public_ip.allocation_method
  sku                 = var.public_ip.sku

}

resource "azurerm_network_interface" "nic" {

  name                = var.nic.name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {

    name                          = var.nic.ip_config_name
    subnet_id                     = azurerm_subnet.subnets["subnet1"].id
    private_ip_address_allocation = var.nic.private_ip_allocation
    public_ip_address_id          = azurerm_public_ip.publicip.id

  }

}
