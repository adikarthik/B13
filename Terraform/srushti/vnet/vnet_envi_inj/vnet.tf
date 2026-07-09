resource azurerm_virtual_network vnet{
	resource_group_name= var.rg_name
	count= length(var.vnet_name)
	name= var.vnet_name[count.index]
	location= var.location
	address_space= var.address
	depends_on=[azurerm_resource_group.rg]
}
