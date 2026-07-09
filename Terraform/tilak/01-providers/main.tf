terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}


resource "local_file" "first-file" {
  filename = "boom.txt"
  content  = "this file is created in providers folder"
}
