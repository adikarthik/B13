module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "virtual_network" {
  source    = "./modules/virtual_network"
  vnet_name = var.vnet_name
  rg_name   = module.resource_group.rg_name
  location  = module.resource_group.location
}

module "subnet" {
  source      = "./modules/subnet"
  subnet_name = var.subnet_name
  rg_name     = module.resource_group.rg_name
  vnet_name   = module.virtual_network.vnet_name
}

module "public_ip" {
  source   = "./modules/public_ip"
  pip_name = var.pip_name
  rg_name  = module.resource_group.rg_name
  location = module.resource_group.location
}

module "network_interface" {
  source    = "./modules/network_interface"
  nic_name  = var.nic_name
  rg_name   = module.resource_group.rg_name
  location  = module.resource_group.location
  subnet_id = module.subnet.subnet_id
  pip_id    = module.public_ip.pip_id
}

module "linux_vm" {
  source         = "./modules/linux_vm"
  vm_name        = var.vm_name
  rg_name        = module.resource_group.rg_name
  location       = module.resource_group.location
  nic_id         = module.network_interface.nic_id
  vm_size        = "Standard_D2s_v3"
  admin_username = var.admin_username
  admin_password = var.admin_password
}
