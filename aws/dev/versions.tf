terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.10.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
