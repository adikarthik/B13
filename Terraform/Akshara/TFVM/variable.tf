variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
}

variable "nic_name" {
  description = "Network Interface Name"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
}

variable "admin_username" {
  description = "Admin Username"
  type        = string
}

variable "admin_password" {
  description = "Admin Password"
  type        = string
  sensitive   = true
}

variable "vm_count" {
  description = "Number of VMs"
  type        = number
  default     = 2
}
