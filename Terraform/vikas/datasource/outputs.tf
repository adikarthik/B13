output "RG-Name" {

  value = data.azurerm_resource_group.pulling-existing-rg.name

}

output "RG-location" {


  value = data.azurerm_resource_group.pulling-existing-rg.location

}


output "Vnet-Name" {

  value = data.azurerm_virtual_network.Vnet1.name

}

output "Vnet-location" {

  value = data.azurerm_virtual_network.Vnet1.location

}
