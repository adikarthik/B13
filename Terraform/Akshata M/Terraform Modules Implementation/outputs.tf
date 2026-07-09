output "resource_group" {
  value = module.resource_group.rg_name
}

output "virtual_network" {
  value = module.virtual_network.vnet_name
}

output "virtual_machine" {
  value = module.linux_vm.vm_name
}
