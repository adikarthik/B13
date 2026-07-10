terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}
provider "local" {}

resource "local_file" "employees" {
  for_each = {

    emp1 = "tejas"
    emp2 = "jayashree"
    emp3 = "tj"

  }

  filename = "${each.key}.txt"
  content  = "employee name ${each.value}"
}
