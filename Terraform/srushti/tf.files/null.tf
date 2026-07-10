resource "null_resource" "xyz" {

  provisioner "local-exec" {

    command = "echo 'It is a null resource' > null.txt"
  }
}
