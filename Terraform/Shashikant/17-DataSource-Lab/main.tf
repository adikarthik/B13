terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "file" {
  filename = "demo.txt"
  content  = "Hello Terraform"
}



data "local_file" "read_file" {
  filename = local_file.file.filename
}