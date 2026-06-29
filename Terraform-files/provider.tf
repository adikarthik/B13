terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"
    }
  }
}

provider "azurerm" {
  features {}
   client_id = "f171fc95-b265-4fbb-92f9-af307cde5094"
   client_secret = ".zL8Q~uNuXLLs0m2of9Vfg66gXwzDC7kdJ6Recsk"
   tenant_id = "6c90ff90-a253-45d2-a89b-1f6828be6e6f"
   subscription_id = "f1f93748-b0dc-4457-ad8b-f781d5490e01"
}
