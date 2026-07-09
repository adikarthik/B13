# Create Resource Group
resource "azurerm_resource_group" "my_rg" {
  name     = var.rg_name
  location = var.location
}

# Create Virtual Network
resource "azurerm_virtual_network" "my_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name

  address_space = ["10.10.0.0/16"]
}

# Create Subnet
resource "azurerm_subnet" "my_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.my_rg.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name

  address_prefixes = ["10.10.1.0/24"]
}

# Create Public IP
resource "azurerm_public_ip" "vm_pip" {
  for_each = toset(var.linux_vm_names)

  name                = "${each.value}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

# Create Network Interface
resource "azurerm_network_interface" "vm_nic" {
  for_each = toset(var.linux_vm_names)

  name                = "${each.value}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip[each.key].id
  }
}

# Create Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each = toset(var.linux_vm_names)

  name                = each.value
  computer_name       = each.value
  location            = var.location
  resource_group_name = azurerm_resource_group.my_rg.name

  network_interface_ids = [
    azurerm_network_interface.vm_nic[each.key].id
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
}
