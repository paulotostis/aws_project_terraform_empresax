resource "kubernetes_namespace" "proxysql" {
  metadata {
    name = "proxysql"
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations,
      metadata[0].labels
    ]
  }
}

resource "helm_release" "proxysql" {
  name       = "proxysql"
  chart      = "proxysql"
  version    = local.version_proxysql_chart
  repository = local.helm_repository_dysnix
  namespace  = kubernetes_namespace.proxysql.metadata[0].name

  values = [
    yamlencode({
      "image" = {
        "tag" = local.version_proxysql_image,
      },

      "proxysql_cluster" = {
        "satellite" = {
          "kind" = "Deployment",
        },
      },

      "mysql_servers" = {
        "mysql.demo" = {
          "address"         = "mysql.demo",
          "port"            = 3306,
          "hostgroup"       = 0,
          "max_connections" = 200,
        },
      },

      "mysql_users" = {
        "empresax" = {
          "username"          = "empresax",
          "password"          = "empresax",
          "default_hostgroup" = 0,
        },
      },
    }),
  ]

  depends_on = [kubernetes_namespace.proxysql]
}
