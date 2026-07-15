data "azurerm_resource_group" "rg" {
name = "gousia_rg"
}


resource "azurerm_storage_account" "asa" {
name = "gousia27"
resource_group_name = data.azurerm_resource_group.rg.name
location = data.azurerm_resource_group.rg.location
account_tier = "Standard"
account_replication_type = "LRS"
}
