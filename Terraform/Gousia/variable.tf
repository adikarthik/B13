variable "rg_name" {
default = "my_rg"
type = string
}

variable "name" {
default = "vnet1"
type = string
}

variable "location" {
default = "centralindia"
type = string
}

variable "address_space" {
default = ["10.0.0.0/16"]
type = list(string)
}
