
variable "location" {
  default = "westus"
}

variable "rg_name" {
  default = "tf_rg"
}

variable "address" {
  default = ["10.1.0.0/16", "10.2.0.0/16"]
  type    = list(string)
}
variable "tf_vnet" {
  default = ["tf_vnet1", "tf_vnet2"]
}

