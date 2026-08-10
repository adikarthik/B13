variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "environment" {
  description = "environment name"
  type        = string
  default     = "dev"
}