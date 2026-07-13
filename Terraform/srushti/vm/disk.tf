# Managed Disk
resource "azurerm_managed_disk" "disk" {
  name                 = "sm-disk"
  location             = azurerm_resource_group.rg3.location
  resource_group_name  = azurerm_resource_group.rg3.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 32
}
