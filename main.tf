module "aws" {
  source = "./aws"

  aws_root_credentials = {
    access_key = var.aws_root_access_key
    secret_key = var.aws_root_secret_key
  }

  route53 = {
    acme_email = var.acme_email
    region     = var.route53_iam_region
    access_key = var.route53_iam_access_key
    secret_key = var.route53_iam_secret_key
  }
}

module "betteruptime" {
  source = "./betteruptime"

  betteruptime_api_token = var.betteruptime_api_token
}
