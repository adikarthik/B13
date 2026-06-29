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


variable "subnet_name" {
default = "subnet1"
type = string
}

variable "vnet_name" {
default = "vnet1"
type = string
}

variable "address_prefixes" {
default = ["10.0.1.0/24"]
type = list(string)
}
