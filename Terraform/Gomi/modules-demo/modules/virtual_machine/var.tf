variable "vm_values" {
 type = object ({

name = string
location = string
rg_name = string
nic_id = string
vm_size = string

storage = object({
name = string
create_option = string
disk_type = string
caching = string
})

image = object({
publisher = string
offer = string
sku = string
version = string
})

profile = object({
cp_name = string
username = string
password = string
})

user_access = object({
access = string
})

})




default = {
name = "gomi-vm-mod"
location = "east us"
rg_name = "rg-modules"
nic_id = "f45c153b-3854-4044-b913-0b74ce673172"
vm_size = "standard_B2s"

storage ={
name = "gomi-vm-mod-osdisk"
create_option = "FromImage"
disk_type = "Standard_LRS"
caching = "ReadWrite"
}

image = {
publisher = "Canonical"
offer = "001-com-ubuntu-server-jammy"
sku = "22_04-lts"
version = "latest"
}

profile = {
cp_name = "gom-vm-mod"
username = "gomiadmin"
password = "p@ssword2123"
}
user_access = {
access = "false"
}
}
}
