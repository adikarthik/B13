variables "nicmod" {
type = object ({
name = string
location = string
rg_name = string


ip_configuration = object({
name = string
subnet_id = string
private_ip_address_allocation = string
})

})
}

default = {

name = "nic-vm1"
location = "east us"
rg_name = "gomi_rg_name"

ip_configuration = {
 name = "internal"
subnet_id =  "/subscriptions/a81a1fbd-7f56-4047-86f4-5e06793d5ca9/resourceGroups/applicationgrp/providers/Microsoft.Network/virtualNetworks/vnet-app/subnets/subnet1 "
private_ip_address_allocation = "dynamic"
}
}
