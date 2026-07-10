output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "file_share_name" {
  value = azurerm_storage_share.fileshare.name
}

output "file_share_url" {
  value = azurerm_storage_share.fileshare.url
}
