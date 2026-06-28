
data "azurerm_resource_group" "pulling-existing-rg" {

  name = "Jenkins-RG"

}

data "azurerm_virtual_network" "Vnet1" {


  name                = "Jenkins-VM-vnet"
  resource_group_name = data.azurerm_resource_group.pulling-existing-rg.name

}

