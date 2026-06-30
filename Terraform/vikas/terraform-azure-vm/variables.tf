variable "resource_group" {

  type = object({

    name     = string
    location = string

  })

}

variable "virtual_network" {

  type = object({

    name          = string
    address_space = list(string)

  })

}

variable "subnet" {

  type = object({

    name             = string
    address_prefixes = list(string)

  })
}


variable "network_security_group" {

  type = object({

    name = string

  })

}

variable "network_security_rule" {

  type = object({

    name                       = string
    prioirity                  = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string


  })

}



variable "public_ip" {

  type = object({

    name              = string
    allocation_method = string
    sku               = string

  })

}

variable "network_interface" {

  type = object({

    name                          = string
    ip_configuration_name         = string
    private_ip_address_allocation = string

  })

}


variable "virtual_machine" {

  sensitive = true
  type = object({

    name           = string
    size           = string
    admin_username = string
    admin_password = string

    os_disk = object({

      caching              = string
      storage_account_type = string

    })

    image = object({

      publisher = string
      offer     = string
      sku       = string
      version   = string

    })

  })

}


variable "storage_account" {

  type = object({

    name                     = string
    account_tier             = string
    account_replication_type = string

  })

}

variable "tags" {

  type = map(string)

}


