module "rg3" {
  source = "./modules/resource_group"

  name     = "gomiapprg"
  location = "east us"
}


module "nicmod" {

  source = "./modules/nic"

  vm_params = {

    vm_name     = "gominic"
    vm_location = module.rg3.rg_location
    rg_name     = module.rg3.rg_name

ip_configuration = {
      name                          = "internal"
      subnet_id                     = "/subscriptions/a81a1fbd-7f56-4047-86f4-5e06793d5ca9/resourceGroups/applicationgrp/providers/Microsoft.Network/virtualNetworks/vnet-app/subnets/subnet1"
      private_ip_address_allocation = "Dynamic"
    }

  }
}

module "gomi-storage-module" {

source = "./modules/storage_account"

  storage_value = {
name = "gomstoragemodule"
location = module.rg3.rg_location
rg_name = module.rg3.rg_name
acc_tier = "Standard"
acc_replication = "LRS"
acc_type = "BlobStorage"
access_https = true
tls_version = "TLS1_2"
}
}

module "vm-gom-module" {
source = "./modules/virtual_machine"

 vm_values = {
name = "vm-new-mod"
location = module.rg3.rg_location
rg_name = module.rg3.rg_name
nic_id = module.nicmod.nic_id
vm_size = "Standard_B2S"

storage = {
name = "vm-gom-mod-os_disk"
create_option = "FromImage"
disk_type = "Standard_LRS"
caching = "ReadWrite"
}

image= {
publisher = "Canonical"
offer = "0001-com-ubuntu-server-jammy"
sku = "22_04-lts"
version = "latest"
}

profile = {
cp_name = "vm-gom-mod"
username = "gomiadmin"
password = "anniyan@21"
}

user_access ={
access = "false"
}

}
}

