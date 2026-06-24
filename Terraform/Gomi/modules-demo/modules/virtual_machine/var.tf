variables "vm_values" {
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
password = stirng
})

user_access = object({
access = string
})

})

}


defaults = {
name = "gomi-vm-mod"
location = "east us"
rg_name = "rg-modules"
nic_id = "f45c153b-3854-4044-b913-0b74ce673172"
vm_size = "standard_B2s"

storage ={
name = "gomi-vm-mod-osdisk"
create_option = "FromImage"
disk_tyoe = "Standard_LRS"
caching = "ReadWrite"
}

image = {
publisher = "Canobical"
offer = "001-com-ubuntu-server-jammu"
sku = "22_04-lts"
version = "latest"
}

profile = {
cp_name = "gom-vm-mod"
username = "gomiadmin"
passwrod = "p@ssword2123"
}
user_acces = {
access = "false"
}
