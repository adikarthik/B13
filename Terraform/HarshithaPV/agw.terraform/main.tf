resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {

  name                = "demo-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_subnet" "appgw" {

  name                 = "appgw-subnet"

  resource_group_name  = azurerm_resource_group.rg.name

  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes     = ["10.0.1.0/24"]

}

resource "azurerm_public_ip" "appgw" {

  name                = "appgw-public-ip"

  location            = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  allocation_method   = "Static"

  sku                 = "Standard"

}


resource "azurerm_application_gateway" "appgw" {

  name                = "demo-appgw"

  location            = azurerm_resource_group.rg.location

  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = azurerm_subnet.appgw.id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  frontend_ip_configuration {

    name                 = "frontend-ip"

    public_ip_address_id = azurerm_public_ip.appgw.id

  }

  backend_address_pool {

    name = "backend-pool"

  }

  backend_http_settings {

    name                  = "http-settings"

    cookie_based_affinity = "Disabled"

    port                  = 80

    protocol              = "Http"

    request_timeout       = 30

  }

  http_listener {

    name                           = "listener"

    frontend_ip_configuration_name = "frontend-ip"

    frontend_port_name             = "http-port"

    protocol                       = "Http"

  }

  request_routing_rule {

    name                       = "rule1"

    rule_type                  = "Basic"

    http_listener_name         = "listener"

    backend_address_pool_name  = "backend-pool"

    backend_http_settings_name = "http-settings"

    priority                   = 1

  }

}


