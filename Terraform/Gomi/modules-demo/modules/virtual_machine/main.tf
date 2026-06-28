resource "azurerm_virtual_machine" "vm-gom-module" {
name = var.vm_values.vm_name
location = var.vm_values.location 
resource_ group_name = var.vm_values.rg_name
network_interface_ids = var.vm_values.nic_id
vm_size = var.vm_values.vm_size

storage_os_disk {

name = var.vm_values.storage.name 
create_option = "FormImage"
managed_disk_type = var.vm_values.storage.disk_type
caching = var.vm_values.storage.caching
}

storage_image_reference {
publisher = var.vm_values.image.publisher
offer = var.vm_values.image.offer
sku = var.vm_values.image.sku
version = var.vm_values.image.version
}

os_profile {
computer_name = var.vm_values.profile.cp_name
admin_username = var.vm_values.profile.username
admin_password = var.vm_values.profile.password
}

os_profile_linux_config {
disable_passwrod_authentication = var.vm_values.user_access.access
}

}

