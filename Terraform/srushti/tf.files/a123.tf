resource "local_file" "test01" {
  filename = "xyz01.txt"
  content  = "first content"
}

resource "local_file" "test02" {
  filename = "xyz02.txt"
  content  = "second content"
}

resource "local_file" "test03" {
  filename = "xyz03.txt"
  content  = "third content"
}

