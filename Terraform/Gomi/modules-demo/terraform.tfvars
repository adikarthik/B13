#resource_group

rg-name     = "applicationgrp"
rg-location = "east us"


nsg = "NSG-app"

vnet = {

  name = "vnet-app"

  address_space = ["10.0.0.0/16"]

}

subnets = {

  subnet1 = {

    name = "subnet1"

    address_prefixes = ["10.0.2.0/26"]

  }

  subnet2 = {

    name             = "subnet2"
    address_prefixes = ["10.0.3.0/26"]

  }
}


nic = {

  name                  = "nic-app"
  ip_config_name        = "nic-ip-name"
  private_ip_allocation = "Dynamic"

}
