resource "azurerm_linux_virtual_machine" "vm" {

  for_each = {
    vm1 = "Standard_B1s"
    vm2 = "Standard_B2s"
    vm3 = "Standard_D2s_v3"
  }

  name                = each.key
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = each.value

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
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
