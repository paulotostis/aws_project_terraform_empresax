module "vpc_peering" {
  source  = "grem11n/vpc-peering/aws"
  version = "4.0.1"

  providers = {
    aws.this = aws
    aws.peer = aws.peer
  }

  this_vpc_id = module.vpc.vpc_id
  peer_vpc_id = var.peer_vpc_id

  auto_accept_peering = true

  tags = {
    Name    = "Development"
    Account = "Root"
    VPC     = "empresax"
  }
}
