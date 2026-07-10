terraform {
  cloud {
    organization = "sanju-b13"

    workspaces {
      name = "rg"
    }
  }
}
provider "azurerm" {
  features {}
}