provider "azurerm" {
  features {}
  subscription_id = "a81a1fbd-7f56-4047-86f4-5e06793d5ca9"
}
resource "azurerm_resource_group" "rgdemo" {
  name     = "cli_grp"
  location = "East US"
}

import{
        id= "/subscriptions/a81a1fbd-7f56-4047-86f4-5e06793d5ca9/resourceGroups/cli_grp"
		to= azurerm_resource_group.rgdemo
B
		}
