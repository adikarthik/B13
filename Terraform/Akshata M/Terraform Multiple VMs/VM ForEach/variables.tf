variable "rg_name" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Subnet"
  type        = string
}

variable "admin_username" {
  description = "VM Username"
  type        = string
}

variable "admin_password" {
  description = "VM Password"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "VM Size"
  type        = string
}

variable "linux_vm_names" {
  description = "List of Linux VM Names"
  type        = list(string)
}
