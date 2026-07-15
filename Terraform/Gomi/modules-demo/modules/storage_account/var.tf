variable "storage_value" {
type = object({
name = string
location = string
rg_name = string
acc_tier = string
acc_replication = string
acc_type = string
access_https = string
tls_version = string
})



default = {
name = "gomi11223344"
location = "east us"
rg_name = "applicationrg"
acc_tier = "Standard"
acc_replication = "LRS"
acc_type = "BlobStorage"
access_https = true
tls_version = "TLS1_2"
}
}
