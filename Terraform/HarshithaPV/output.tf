output "load_balancer_id" {
  value = azurerm_lb.lb.id
}

output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

