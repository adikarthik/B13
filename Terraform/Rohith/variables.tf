variable "RGname"{
type = string
}

variable "RGlocation"{
type = string
}

variable "addspace"{
type = list(string)
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for Azure VM"
}
