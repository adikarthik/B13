 resource local_file testfile {
 filename =each.value
 for_each = var.filenamelist
 content = "hi there"
 }

 resource local_file testfile1 {
 filename =each.value
 for_each = var.filenamemap
 content = "hi there"
 }


variable filenamemap {
type = map(string)
default = {
 name1 = "suvi"
 course = "devops"
 }
}
variable filenamelist {
type = set(string)
default = ["suvi1", "Devops1"]
 }

  locals {
 filename_upper = [ for value in var.filenamelist : upper(value) ]
 filename_upper_map = { for key, value in var.filenamemap : upper(key)=>lower(value) }


 }

  output filename_upper {
 value = local.filename_upper
 }

  output filename_upper_map {
 value = local.filename_upper_map
 }
