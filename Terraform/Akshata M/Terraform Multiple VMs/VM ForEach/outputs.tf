output "vm_names" {
  description = "Created VM Names"
  value       = keys(azurerm_linux_virtual_machine.linux_vm)
}

output "public_ip_addresses" {
  description = "Public IPs of VMs"

  value = {
    for vm, ip in azurerm_public_ip.vm_pip :
    vm => ip.ip_address
  }
}
