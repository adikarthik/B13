terraform {

  backend "azurerm" {

    resource_group_name  = "demo-practice-js"
    storage_account_name = "newstoragforprct"
    container_name       = "tfstate-container"
    key                  = "terraform.tfstate"

  }
}
