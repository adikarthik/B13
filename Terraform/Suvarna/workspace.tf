terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "example" {
  filename = "${terraform.workspace}.txt"

  content = <<EOF
Current Workspace: ${terraform.workspace}
This file was created by Terraform.
EOF
}
