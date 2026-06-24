variabel "storage_values" {
type = object({
name = string
location = string
rg_name = string
acc_tier = string
acc_replication = string
acc_type = string
access_https = boolean
tls_vesrion = string
})
}


default = {
name = "gomi11223344"
location = "east us"
rg_name = "applicationrg"
acc_tier = "Standard"
acc_repliation = "LRS"
acc_type = "StorageV2"[
access_https = true
tls_version = "LTS_2"
}
