locals {
  cluster_name = "empresax-dev"

  version_proxysql_chart   = "0.3.1" # https://github.com/dysnix/charts/releases?q=proxysql
  version_proxysql_image   = "2.2.2" # https://github.com/sysown/proxysql/releases
  version_external_secrets = "8.3.2" # https://github.com/external-secrets/kubernetes-external-secrets/releases
  version_kong_chart       = "1.0.2" # https://github.com/Kong/charts/releases

  helm_repository_dysnix           = "https://dysnix.github.io/charts"
  helm_repository_external_secrets = "https://external-secrets.github.io/kubernetes-external-secrets/"
  helm_repository_kong             = "https://charts.konghq.com"
}
