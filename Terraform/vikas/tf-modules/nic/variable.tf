variable "NIC" {
type = object ({

name = string
location = string
rg-name = string

ip_configuration = ({

name = string
subnet = string
privateip = string

})
}

)
}

default = {

name = "Vikas"
location = "east us"
rg-name = "vikas-RG"

ip_configuration = {

name = "internal"
subnet = ""
privateip = "dynamic"

}
}

