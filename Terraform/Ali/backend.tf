terraform {
  required_version = "1.15.6"

  cloud {

    organization = "ali-resource"

    workspaces {
      name = "ali-workspace"
    }
  }
}
