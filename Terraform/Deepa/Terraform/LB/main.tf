terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# =========================================================
# RESOURCE GROUP
# =========================================================

resource "azurerm_resource_group" "rg" {
  name     = "lb-demo-rg"
  location = "Central India"
}

# =========================================================
# VIRTUAL NETWORK
# =========================================================

resource "azurerm_virtual_network" "vnet" {
  name                = "lb-demo-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# =========================================================
# SUBNET
# =========================================================

resource "azurerm_subnet" "subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# =========================================================
# PUBLIC IP
# =========================================================

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "lb-public-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"
  sku               = "Standard"
}

# =========================================================
# LOAD BALANCER
# =========================================================

resource "azurerm_lb" "lb" {
  name                = "demo-lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

# =========================================================
# BACKEND ADDRESS POOL
# =========================================================

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.lb.id
}

# =========================================================
# HEALTH PROBE
# =========================================================

resource "azurerm_lb_probe" "http_probe" {
  name            = "http-probe"
  loadbalancer_id = azurerm_lb.lb.id

  protocol     = "Http"
  port         = 80
  request_path = "/"
}

# =========================================================
# LOAD BALANCING RULE
# =========================================================

resource "azurerm_lb_rule" "http_rule" {
  name            = "http-rule"
  loadbalancer_id = azurerm_lb.lb.id

  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.backend_pool.id
  ]

  probe_id = azurerm_lb_probe.http_probe.id
}

# =========================================================
# EXISTING VM NIC
#
# Existing VM:
#   VM Name: naukri-build-vm
#   Resource Group: NAUKRI-RG
#   NIC: naukri-build-vmVMNic
#   IP Configuration: ipconfignaukri-build-vm
# =========================================================

resource "azurerm_network_interface_backend_address_pool_association" "naukri_vm_lb" {
  network_interface_id = "/subscriptions/78c27fe4-9343-4fe3-aeee-135e03f328a4/resourceGroups/naukri-rg/providers/Microsoft.Network/networkInterfaces/naukri-build-vmVMNic"

  ip_configuration_name = "ipconfignaukri-build-vm"

  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}

# =========================================================
# OUTPUT
# =========================================================

output "load_balancer_public_ip" {
  description = "Public IP address of the Azure Load Balancer"
  value       = azurerm_public_ip.lb_public_ip.ip_address
}

output "load_balancer_name" {
  description = "Azure Load Balancer name"
  value       = azurerm_lb.lb.name
}

output "backend_pool_name" {
  description = "Load Balancer backend pool name"
  value       = azurerm_lb_backend_address_pool.backend_pool.name
}
