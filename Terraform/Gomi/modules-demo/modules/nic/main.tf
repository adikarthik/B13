resource "azurerm_network_interface" "nic-mod"{

name = "${var.vm_params.vm_name}-nic"
location = var.vm_params.vm_location
resource_group_name = var.vm_params.rg_name

ip_configuration {

name = "internal-ip-config"
subnet_id = var.vm_params.ip_configuration.subnet_id
private_ip_address_allocation = "Dynamic"

}
}
