terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }

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
