
data "local_file" "read_file" {
  filename = "sample.txt"
}

output "file_content" {
  value = data.local_file.read_file.content
}
