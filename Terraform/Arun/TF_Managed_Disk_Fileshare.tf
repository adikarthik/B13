# Resource Group
resource "azurerm_resource_group" "rg3" {
  name     = "arun-rg"
  location = "Central India"
}

# Managed Disk
resource "azurerm_managed_disk" "disk" {
  name                 = "arun-disk"
  location             = azurerm_resource_group.rg3.location
  resource_group_name  = azurerm_resource_group.rg3.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 32
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "arunstorage123456"
  resource_group_name      = azurerm_resource_group.rg3.name
  location                 = azurerm_resource_group.rg3.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# File Share
resource "azurerm_storage_share" "fileshare" {
  name               = "sharedfiles"
  storage_account_id = azurerm_storage_account.sa.id
  quota              = 50
}

output "disk_id" {
  value = azurerm_managed_disk.disk.id
}

output "fileshare_name" {
  value = azurerm_storage_share.fileshare.name
}


# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "arun-vnet"
  location            = azurerm_resource_group.rg3.location
  resource_group_name = azurerm_resource_group.rg3.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "arun-subnet"
  resource_group_name  = azurerm_resource_group.rg3.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "arun-nic"
  location            = azurerm_resource_group.rg3.location
  resource_group_name = azurerm_resource_group.rg3.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Linux VM
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "arun-vm"
  location            = azurerm_resource_group.rg3.location
  resource_group_name = azurerm_resource_group.rg3.name
  size                = "Standard_B1s"

  admin_username                  = "azureuser"
  admin_password                  = "azureuser@123"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

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
}