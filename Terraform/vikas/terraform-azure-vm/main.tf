resource "azurerm_resource_group" "rg1" {

  name     = "${local.project}-VM-RG"
  location = var.resource_group.location

  tags = var.tags

}

resource "azurerm_virtual_network" "vnet1" {

  name                = "${local.project}-VM-VNET"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = var.virtual_network.address_space

  tags = var.tags

}


resource "azurerm_subnet" "subnet1" {

  name                 = var.subnet.name
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = var.subnet.address_prefixes

}

resource "azurerm_network_security_group" "nsg1" {

  name                = var.network_security_group.name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  tags = var.tags

}

resource "azurerm_network_security_rule" "allow_ssh" {

  name      = var.network_security_rule.name
  priority  = var.network_security_rule.prioirity
  direction = var.network_security_rule.direction
  access    = var.network_security_rule.access
  protocol  = var.network_security_rule.protocol

  source_port_range      = var.network_security_rule.source_port_range
  destination_port_range = var.network_security_rule.destination_port_range

  source_address_prefix      = var.network_security_rule.source_address_prefix
  destination_address_prefix = var.network_security_rule.destination_address_prefix

  resource_group_name         = azurerm_resource_group.rg1.name
  network_security_group_name = azurerm_network_security_group.nsg1.name

}



resource "azurerm_public_ip" "pip1" {

  name                = var.public_ip.name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  allocation_method = var.public_ip.allocation_method
  sku               = var.public_ip.sku

  tags = var.tags

}


resource "azurerm_network_interface" "nic1" {

  name                = var.network_interface.name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {

    name                          = var.network_interface.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = var.network_interface.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.pip1.id

  }

}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {

  network_interface_id      = azurerm_network_interface.nic1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id

}


resource "azurerm_linux_virtual_machine" "vm1" {

  name                = var.virtual_machine.name
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  size                = var.virtual_machine.size

  admin_username = var.virtual_machine.admin_username
  admin_password = var.virtual_machine.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic1.id
  ]

  tags = var.tags

  depends_on = [
    azurerm_network_interface_security_group_association.nic_nsg
  ]

  lifecycle {

    ignore_changes = [
      size
    ]

    replace_triggered_by = [
      azurerm_network_interface.nic1
    ]

  }

  provisioner "local-exec" {

    command = "echo VM ${self.name} created successfully"

  }


  os_disk {

    caching              = var.virtual_machine.os_disk.caching
    storage_account_type = var.virtual_machine.os_disk.storage_account_type

  }

  source_image_reference {

    publisher = var.virtual_machine.image.publisher
    offer     = var.virtual_machine.image.offer
    sku       = var.virtual_machine.image.sku
    version   = var.virtual_machine.image.version


  }
}


resource "azurerm_storage_account" "storage1" {

  name                = var.storage_account.name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location

  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type

  tags = var.tags


  lifecycle {

    prevent_destroy = false

  }

}
