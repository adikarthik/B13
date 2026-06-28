resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_storage_account" "storage" {

  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_managed_disk" "disk" {

  name                 = var.disk_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"

  create_option = "Empty"

  disk_size_gb = 32

}

resource "azurerm_storage_share" "fileshare" {

  name               = var.file_share_name
  storage_account_id = azurerm_storage_account.storage.id
  quota              = 50

}
