output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "public_ip" {
  value = azurerm_public_ip.publicip.ip_address
}
