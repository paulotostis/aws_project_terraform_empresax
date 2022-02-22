provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::098476440369:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  alias  = "peer"
  region = "us-east-1"

  access_key = var.aws_root_credentials.access_key
  secret_key = var.aws_root_credentials.secret_key
}
