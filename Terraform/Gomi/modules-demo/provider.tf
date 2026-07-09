terraform {
  required_version = ">= 1.15.5"

  cloud {
    organization = "gomigomz"
    workspaces {
      name = "gomigomzterrt"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
  }
}

provider "azurerm" {
  features {}
}
