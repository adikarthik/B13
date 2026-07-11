resource "azurerm_virtual_machine" "VM1" {

name = "${var.VM1.name}"
resource_group_name = var.VM1.rgname
location = var.VM1.location
network_interface_ids = var.VM1.nic
vm_size = var.VM1.vm_size


storage_os_disk {
name = var.VM1.storage_os_disk.name
create_option = "FromImage"
managed_disk_type = var.VM1.storage_os_disk.managed_disk_type
caching = var.VM1.storage_os_disk.caching

}

storage_image_reference {

publisher = var.VM1.storage_image_reference.publisher
offer = var.VM1.storage_image_reference.offer
sku = var.VM1.storage_image_reference.sku
version = var.VM1.storage_image_reference.version


}

os_profile {

computer_name = var.VM1.os_profile.computer_name
admin_username = var.VM1.os_profile.admin_username
admin_password = var.VM1.os_profile.admin_password

}

os_profile_linux_config {

disable_password_authentication = false
}
}
