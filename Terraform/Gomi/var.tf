variable "rg-name" {

  type = string


}


variable "rg-location" {

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

    })
  )
}

variable "nic" {
  type = object({
    name                  = string
    ip_config_name        = string
    private_ip_allocation = string
  })
}
