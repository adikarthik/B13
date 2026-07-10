variable "rg_name" {
  default = "vs_rg"
}
variable "location" {
  default = "eastus"
}
variable "vnet_name" {
  default = "vs_vnet"
}
variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}
variable "subnet_name" {
  default = "vs_subnet"
}