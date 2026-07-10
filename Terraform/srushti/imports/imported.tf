# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/20a282cd-41fe-411d-a64e-1727fb143505/resourceGroups/ss_rg"
resource "azurerm_resource_group" "rg1" {
  location   = "koreacentral"
  managed_by = null
  name       = "ss_rg"
  tags       = {}
}

# __generated__ by Terraform from "/subscriptions/20a282cd-41fe-411d-a64e-1727fb143505/resourceGroups/ss_rg/providers/Microsoft.Network/publicIPAddresses/Linux-ip"
resource "azurerm_public_ip" "ss_ip" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  ddos_protection_plan_id = null
  domain_name_label       = null
  domain_name_label_scope = null
  edge_zone               = null
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "koreacentral"
  name                    = "Linux-ip"
  public_ip_prefix_id     = null
  resource_group_name     = "ss_rg"
  reverse_fqdn            = null
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
}
