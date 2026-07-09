variable "rg_name" {

  type = string

}

variable "rg_location" {

  type = string

}

variable "nsg" {

  type = string

}

variable "vnet" {

  type = object({

    name = string

    address_space = list(string)

  })

}

variable "subnets" {

  type = map(object({

    name = string

    address_prefixes = list(string)

  }))

}

variable "public_ip" {

  type = object({

    name              = string
    allocation_method = string
    sku               = string

  })

}

variable "nic" {

  type = object({

    name                  = string
    ip_config_name        = string
    private_ip_allocation = string

  })

}

variable "storage_account" {

  type = object({

    name                     = string
    account_tier             = string
    account_replication_type = string

  })

}

variable "vm" {

  type = object({

    name           = string
    size           = string
    admin_username = string

  })

}
