resource "azurerm_resource_group" "rg" {
  count = var.count_value

  name     = "AkshRG-${count.index}"
  location = var.location
}
