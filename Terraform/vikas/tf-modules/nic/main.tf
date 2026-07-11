resource "azurerm_network_interface" "NIC1" {

name = "${var.NIC.name}-NIC "
location = var.NIC.location
resource_group_name = var.NIC.rg-name

ip_configuration {

name = "${var.NIC.ip_configuration.name}-IP}"
subnet_id = var.NIC.ip_configuration.subnet
private_ip_address_allocation = var.NIC.ip_configuration.privateip

}
}

