# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = ["10.0.1.0/24"]
}

# Public IP
resource "azurerm_public_ip" "pip" {
  count               = var.vm_count
  name                = "${var.public_ip_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.nic_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}

# Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}"
  computer_name       = "${var.vm_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  size           = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  computer_name = var.vm_name
}
