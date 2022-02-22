module "prd" {
  source = "./prd"

  aws_root_credentials = var.aws_root_credentials
  route53              = var.route53
  peer_vpc_id          = local.peer_vpc_id
}

module "dev" {
  source = "./dev"

  aws_root_credentials = var.aws_root_credentials
  route53              = var.route53
  peer_vpc_id          = local.peer_vpc_id
}
