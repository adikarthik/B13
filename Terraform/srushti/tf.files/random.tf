resource "random_string" "random" {
  length           = 10
  special          = true
  min_numeric      = 3
  min_upper        = 2
  override_special = "/@£$"
}
