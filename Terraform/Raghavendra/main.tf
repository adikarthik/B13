provider "local" {}

resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello Raghavendra, this file was created by Terraform!"
}
