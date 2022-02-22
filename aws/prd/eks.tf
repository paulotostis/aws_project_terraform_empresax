module "eks" {
  source  = "app.terraform.io/empresax/eks/aws"
  version = "0.0.31"

  name        = local.cluster_name
  k8s_version = "1.21"
  subnet_ids  = module.vpc.private_subnets
  vpc_id      = module.vpc.vpc_id

  node_groups = [
    {
      instance_types = ["t3a.small"],
      spot           = true
    }
  ]
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = module.eks.cluster_ca_certificate
  token                  = module.eks.cluster_auth_token
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = module.eks.cluster_ca_certificate
  token                  = module.eks.cluster_auth_token
  load_config_file       = false
}
