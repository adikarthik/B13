
output "vm_names" {
  value = azurerm_linux_virtual_machine.vm[*].name
}

output "public_ip_addresses" {
  value = azurerm_public_ip.pip[*].ip_address
}
