data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name = "main"
  cidr = "10.32.0.0/16"
  azs  = data.aws_availability_zones.available.names

  private_subnets = ["10.32.1.0/24", "10.32.2.0/24", "10.32.3.0/24"]
  public_subnets  = ["10.32.4.0/24", "10.32.5.0/24", "10.32.6.0/24"]

  enable_nat_gateway   = false
  enable_dns_hostnames = true
}
