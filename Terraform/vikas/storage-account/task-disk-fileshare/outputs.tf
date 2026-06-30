output "disk_name" {
  value = azurerm_managed_disk.disk.name
}

output "file_share_name" {
  value = azurerm_storage_share.fileshare.name
}
