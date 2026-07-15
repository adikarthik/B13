resource "azurerm_storage_account" "gomi-storage-module" {

name = var.storage_value.name
location = var.storage_value.location
resource_group_name = var.storage_value.rg_name
account_tier = var.storage_value.acc_tier
account_replication_type = var.storage_value.acc_replication
account_kind = var.storage_value.acc_type
https_traffic_only_enabled = var.storage_value.access_https
min_tls_version = var.storage_value.tls_version

}

