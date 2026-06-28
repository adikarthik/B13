module "resource_group" {


source = "./modules/Resource-grp"


resource_group_name = var.resource_group_name

location = var.location


}



module "storage" {


source = "./modules/Storage"


storage_account_name = var.storage_account_name


resource_group_name = module.resource_group.name


location = var.location


account_tier = var.account_tier


replication_type = var.replication_type


}



module "vm" {


source = "./modules/VM"


vm_name = var.vm_name


resource_group_name = module.resource_group.name


location = var.location


vm_size = var.vm_size


admin_username = var.admin_username


admin_password = var.admin_password


}

