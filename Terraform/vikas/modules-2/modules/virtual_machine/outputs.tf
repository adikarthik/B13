output "vm_id" {
value = azurerm_virtual_machine.vm-gom-module.id
description = "the reasource if of the created virtaul machine"
}

output "private_ip" {
value = azurerm_virtual_machine.vm-gom-module.private_ip_address
description = "the private ip address assigned to the virtual machine"
}


