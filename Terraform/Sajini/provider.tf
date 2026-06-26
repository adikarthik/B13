terraform {
<<<<<<< HEAD
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
=======
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
<<<<<<< HEAD
}
=======
}
>>>>>>> 3bb082ce3555a6513ead74336bc8d6d8d399ade6
