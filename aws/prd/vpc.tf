data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name = "main"
  cidr = "10.33.0.0/16"
  azs  = data.aws_availability_zones.available.names

  private_subnets = ["10.33.1.0/24", "10.33.2.0/24", "10.33.3.0/24"]
  public_subnets  = ["10.33.4.0/24", "10.33.5.0/24", "10.33.6.0/24"]

  enable_nat_gateway   = true
  enable_dns_hostnames = true
}
