terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "sample" {
  filename = "sample.txt"
  content  = "Hello from Terraform"
}
