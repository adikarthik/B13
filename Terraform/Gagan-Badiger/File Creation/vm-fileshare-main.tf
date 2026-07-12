terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags
}

# File Share
resource "azurerm_storage_share" "fileshare" {
  name               = var.file_share_name
  storage_account_id = azurerm_storage_account.storage.id

  quota = var.quota

  access_tier = var.access_tier
}
