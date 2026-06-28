variable rg_name {	
	default= "ss-rg"
}

variable location {
	default= "koreacentral"
}
variable vnet_name {	
	default= ["ss-vnet1","ss-vnet2"]
	type= list(string)
}
variable address {	
	default= ["10.0.0.0/16"]
	type= list(string)
}
