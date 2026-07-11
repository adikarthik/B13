terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "3307e1c4-c1ce-4bcd-b25e-832db8e4c4f1"
}
