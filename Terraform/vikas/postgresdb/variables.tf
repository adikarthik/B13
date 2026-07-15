variable "resource_group_name" {
  default = "rg-postgres-demo"
}

variable "location" {
  default = "Central India"
}

variable "server_name" {
  default = "vikas-postgres-server01"
}

variable "admin_username" {
  default = "pgadmin"
}

variable "admin_password" {
  default = "Password@12345"
}

variable "database_name" {
  default = "employee"
}

variable "postgres_version" {
  default = "16"
}

variable "sku_name" {
  default = "B_Standard_B1ms"
}

variable "storage_mb" {
  default = 32768
}
