resource "azurerm_linux_virtual_machine" "virtual_machine_new" {
name = var.nvm.name
location = var.nvm.location
resource_group_name = var.nvm.rg_name
size = var.new_virtual_machine.size
network_interface_ids = var.nvm.nic_id
admin_username = var.nvm.admin_username


os_disk {
caching = var.nvm.os_disk.caching
storagr_account_type = var.nvm.os_disk.storage_type
name = var.nvm.os_name.name
}

admin_ssh_key {
username = var.nvm.admin.username
public_key = var.nvm.admin.public_key
}

source_image_reference{
publisher = var.vmn.smr.publisher
offer = var.vmn.smr.offer
sku = var.vmn.smr.sku
version = var.vmn.smr.version
}
}
