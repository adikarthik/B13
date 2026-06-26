terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  features {}
  }

resource "azurerm_resource_group" "Azure_Rg" {
  name     = var.RGname
  location = var.RGlocation
}

resource "azurerm_virtual_network" "Azure_Vnet" {
  name                = "RPvnet"
  location            = azurerm_resource_group.Azure_Rg.location
  resource_group_name = azurerm_resource_group.Azure_Rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.Azure_Rg.name
  virtual_network_name = azurerm_virtual_network.Azure_Vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "Azure_NSG" {
  name                = "NSG1"
  location            = azurerm_resource_group.Azure_Rg.location
  resource_group_name = azurerm_resource_group.Azure_Rg.name
}

resource "azurerm_subnet_network_security_group_association" "NSG_Association" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.Azure_NSG.id
}

