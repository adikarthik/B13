module "rg1" {

source = "./modules/resource_group"

rg_name = "demo-rg"
location = "east us" 

}

module "storage" {

source = "./modules/storage_account"

storage_name = "azureoguhb"
location = "obsou"
rg_name = "ohb"

}
