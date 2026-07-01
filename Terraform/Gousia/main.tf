resource "azurerm_resource_group" "rg" {
name = "my_rg"
location = "centralindia"
}


import {
to = azurerm_resource_group.rg
id = "/subscriptions/c289de48-183f-4c13-88c7-412dedacf9ed/resourceGroups/my_rg"
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

resource "azurerm_storage_account" "sa" {
name = "skgousia2026"
resource_group_name = var.rg_name
location = var.location
account_tier = "Standard"
account_replication_type = "LRS"
}

resource "azurerm_managed_disk" "mydisk" {
name = var.name
resource_group_name = var.rg_name
location = var.location
storage_account_type = "Standard_LRS"
create_option = "Empty"
disk_size_gb = "30"
}
