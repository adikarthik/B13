resource "azurerm_linux_virtual_machine" "vm1" {
  name                = "vm1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = var.location

  size = "Standard_D2s_v3"  

  zone = "2"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic1.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${pathexpand("~/.ssh/id_ed25519.pub")}")
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

  disable_password_authentication = true
}
