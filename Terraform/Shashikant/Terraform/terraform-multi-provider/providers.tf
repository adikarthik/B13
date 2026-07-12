terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.7"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.38"
    }

  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
  region = "us-east-1"
}

provider "random" {}

provider "kubernetes" {}
