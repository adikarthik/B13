data "azurerm_resource_group" "rg" {
  name = "cli_grp"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}
