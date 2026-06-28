resource "azurerm_linux_virtual_machine" "vm" {


name = var.vm_name


resource_group_name = var.resource_group_name


location = var.location


size = var.vm_size


admin_username = var.admin_username


admin_password = var.admin_password


disable_password_authentication = false


}
