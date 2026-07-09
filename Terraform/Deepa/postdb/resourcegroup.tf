resource "azurerm_resource_group" "demq" {
  name     = var.resource_group_name
  location = var.location
}

