terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "testfile" {
  filename = "abc.txt"
  content  = "this is my modified content"
}

resource "local_file" "testfile2" {
  filename = "xyz.txt"
  content  = "this is my second resource"
}

resource "local_file" "testfile3" {
  filename = "pqr.txt"
  content  = "this is my third resource"
}

resource "local_file" "testfile4" {
  filename = "duplicate.txt"
  content  = "duplicate resource"
}
