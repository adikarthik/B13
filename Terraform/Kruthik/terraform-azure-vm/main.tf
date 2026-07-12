resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefix
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_network_security_rule" "rules" {

  for_each = var.nsg_rules

  name     = each.key
  priority = 100 + index(keys(var.nsg_rules), each.key)

  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range      = "*"
  destination_port_range = each.value

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_public_ip" "pip" {

  count = var.vm_count

  name                = "dev-public-ip-${count.index + 1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"

}

resource "azurerm_network_interface" "nic" {
 count = var.vm_count

  name                = "dev-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name = "internal"

    subnet_id = azurerm_subnet.subnet.id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id =  azurerm_public_ip.pip[count.index].id

  }

}

resource "azurerm_network_interface_security_group_association" "nsgassociation" {
    count = var.vm_count

  network_interface_id = azurerm_network_interface.nic[count.index].id

  network_security_group_id = azurerm_network_security_group.nsg.id

}

resource "azurerm_linux_virtual_machine" "vm" {

  count = var.vm_count

depends_on = [
  azurerm_network_interface_security_group_association.nsgassociation
]

lifecycle {
  ignore_changes = [
    tags
  ]
}

  name = "dev-vm-${count.index + 1}"

  location = var.location

  resource_group_name = azurerm_resource_group.rg.name

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  size = var.vm_size

  admin_username = var.admin_username

  disable_password_authentication = true

  admin_ssh_key {

    username = var.admin_username

    public_key = file(pathexpand(var.public_key_path))

  }

  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "Canonical"

    offer = "0001-com-ubuntu-server-jammy"

    sku = "22_04-lts"

    version = "latest"

  }

}
