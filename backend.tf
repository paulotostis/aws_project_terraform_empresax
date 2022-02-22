terraform {
  backend "remote" {
    organization = "Empresax"

    workspaces {
      name = "EmpresaX"
    }
  }

  required_version = ">= 0.13.0"
}
