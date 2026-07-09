provider azurerm {
features{}
}
terraform{
required providers{
azurerm={
source=
version=
}

resource azurerm_resource_group "rg"{
name=
location=
}

resource azurerm_virtual_network "vnet"{
name=
location=
resource_group_name=
address space =["10.0.0.0/16"]
}

resource azurerm_subnet "sub"{
name=
resource_group_name=
virtual_network_name=
address space preffix =[10.0.1.0/24"]
}
resource azurerm_public_ip "pip"{
name=
location=
resource_group_name=
allocation strategy=
}

resource azurerm_network interface "nic"{
name=
location=
resource_group_name=

ipconfiguration{
name =
subnetid=
private_ip_address_allocation=
public_ip_address_id=
}
}
resource azurerm_virtual _machine "vm"{
name=
location=
resource_group_name=
size=
admin_username=

network_interface_ids=[azurerm_network_interface_nic.id]
admin password=
disable_password_authentication=

os_disk{
caching=
storage account_type=
}

