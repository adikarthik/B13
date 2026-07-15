output "vm_public_ip" {

  value = azurerm_public_ip.pip[*].ip_address
}

output "resource_group" {

  value = azurerm_resource_group.rg.name

}

output "virtual_machine_name" {

  value = azurerm_linux_virtual_machine.vm[*].name

}
