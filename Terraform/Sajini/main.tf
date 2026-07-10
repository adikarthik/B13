resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "vm-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
<<<<<<< HEAD
    name                       = "SSH"
=======
    name                       = "AllowSSH"
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
<<<<<<< HEAD

  security_rule {
    name                       = "HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.vm_name}-pip"
=======
}

resource "azurerm_public_ip" "pip" {
  name                = "vm-pip"
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"
}

resource "azurerm_network_interface" "nic" {
<<<<<<< HEAD
  name                = "${var.vm_name}-nic"
=======
  name                = "vm-nic"
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

<<<<<<< HEAD
resource "azurerm_network_interface_security_group_association" "nsg_association" {
=======
resource "azurerm_network_interface_security_group_association" "assoc" {
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
<<<<<<< HEAD
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
=======
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6

  size           = "Standard_B2als_v2"
  admin_username = var.admin_username

  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

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