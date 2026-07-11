variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "file_share_name" {
  type = string
}

variable "quota" {
  type = number
}

variable "access_tier" {
  type = string
}

variable "tags" {
  type = map(string)
}
