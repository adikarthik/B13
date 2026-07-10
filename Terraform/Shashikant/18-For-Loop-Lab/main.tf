locals {
  names = ["dev", "test", "prod"]

  upper_names = [for n in local.names : upper(n)]
}