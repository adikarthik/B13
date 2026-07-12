terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

#############################################
# COUNT
#############################################

resource "local_file" "count_example" {
  count    = 2
  filename = "file-${count.index}.txt"
  content  = "count example"
}

#############################################
# FOR_EACH
#############################################

resource "local_file" "for_each_example" {
  for_each = toset(["a", "b"])

  filename = "${each.key}.txt"
  content  = "for_each example"
}

#############################################
# DEPENDS_ON
#############################################

resource "local_file" "first" {
  filename = "first.txt"
  content  = "first resource"
}

resource "local_file" "second" {
  filename = "second.txt"
  content  = "depends on first"

  depends_on = [local_file.first]
}

