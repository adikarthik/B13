resource azurerm_managed_disk "Azure_Disk"{

name = "CloudDisk"
location = azurerm_resource_group.Azure_Rg.location
resource_group_name = azurerm_resource_group.Azure_Rg.name
storage_account_type = "Standard_LRS"
create_option        = "Empty"
disk_size_gb         = "4"

}


resource "azurerm_virtual_machine_data_disk_attachment" "Azure_DiskAttachVM" {

managed_disk_id    = azurerm_managed_disk.Azure_Disk.id
virtual_machine_id = azurerm_linux_virtual_machine.Azure_VM.id
lun                = "10"
caching            = "ReadWrite"

}
