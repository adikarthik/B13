output "resource_group_name" {

  value = azurerm_resource_group.rg.name

}

output "vnet_name" {

  value = azurerm_virtual_network.vnet.name

}

output "subnet_name" {

  value = azurerm_subnet.subnets["subnet1"].name

}

output "network_security_group_name" {

  value = azurerm_network_security_group.nsg.name

}

output "storage_account_name" {

  value = azurerm_storage_account.storage.name

}

output "public_ip_name" {

  value = azurerm_public_ip.publicip.name

}

output "network_interface_name" {

  value = azurerm_network_interface.nic.name

}
