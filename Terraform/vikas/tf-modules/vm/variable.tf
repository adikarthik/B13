variable "VM1" {

type = object ({

name = string
rgname = string
location = string
nic = string
vm_size = string


storage_os_disk = {

name = string
managed_disk_type = string
caching = string

}

storage_image_reference = {

publisher = string
offer = string 
sku = string 
version = string

}

os_profile = {

computer_name = string
admin_username = string
admin_password = string

}

})





defaults = {

name = "VM1-Module"
rgname = "RG-VM" 
location = "east us"
nic = "/subscriptions/a81a1fbd-7f56-4047-86f4-5e06793d5ca9/resourceGroups/Terraformdemo1/providers/Microsoft.Network/networkInterfaces/vikas-vm646_z1"
vm_size = "Standard_B2s"

}


storage_os_disk {


