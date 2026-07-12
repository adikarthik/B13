terraform {
  backend "azurerm" {
    resource_group_name  = "AkshRG"
    storage_account_name = "akshstg2026"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
