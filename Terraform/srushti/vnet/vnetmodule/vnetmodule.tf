module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.19.0"
  name= "vnet_mod"
  location= "koreasouth"
  parent_id= "/subscriptions/20a282cd-41fe-411d-a64e-1727fb143505/resourceGroups/ss_rg"
  address_space= ["10.0.0.0/16"]
}
