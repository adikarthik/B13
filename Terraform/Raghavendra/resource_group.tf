# Simple Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "vs_rg"
  location = "East US"
}
