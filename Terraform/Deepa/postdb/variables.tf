variable "resource_group_name" {}
variable "location" {}
variable "postgresql_server_name" {}
variable "database_name" {}
variable "admin_username" {}
variable "admin_password" {
  sensitive = true
}
variable "postgresql_version" {
  default = "16"
}

variable "storage_mb" {
  default = 32768
}
variable "sku_name" {
  default = "B_Standard_B1ms"
}
variable "zone" {
  default = "1"
}

