resource "azurerm_resource_group" "rg1" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1"{
    name             = "subnet1"
    resource_group_name= azurerm_resource_group.rg1.name
    virtual_network_name=azurerm_virtual_network.vnet1.name
    address_prefixes = ["10.0.0.0/24"]
  }


resource "azurerm_network_interface" "nic1" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_storage_account" "strg1" {
  name                     = var.strgname
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg1.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
