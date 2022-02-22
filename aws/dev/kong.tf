resource "kubernetes_namespace" "kong" {
  metadata {
    name = "kong"
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations,
      metadata[0].labels
    ]
  }
}

resource "helm_release" "kong" {
  name       = "kong"
  chart      = "kong"
  version    = local.version_kong_chart
  repository = local.helm_repository_kong
  namespace  = kubernetes_namespace.kong.metadata[0].name

  set {
    name  = "env.database"
    value = "postgres"
  }

  set {
    name  = "env.prefix"
    value = "/empresax/"
  }

  set {
    name  = "env.pg_user"
    value = "empresax"
  }

  set {
    name  = "env.pg_password.valueFrom.secretKeyRef.key"
    value = "postgresql-password"
  }

  set {
    name  = "env.pg_password.valueFrom.secretKeyRef.name"
    value = "kong-postgresql"
  }

  set {
    name  = "postgresql.enabled"
    value = true
  }

  set {
    name  = "postgresql.postgresqlUsername"
    value = "empresax"
  }

  set {
    name  = "postgresql.postgresqlDatabase"
    value = "empresax"
  }

  set {
    name  = "postgresql.service.port"
    value = 5432
  }

  set {
    name  = "admin.enabled"
    value = true
  }

  set {
    name  = "admin.http.enabled"
    value = true
  }

  set {
    name  = "admin.http.servicePort"
    value = 8001
  }

  set {
    name  = "admin.http.containerPort"
    value = 8001
  }

  set {
    name  = "ingressController.enabled"
    value = true
  }

  set {
    name  = "ingressController.installCRDs"
    value = false
  }

  depends_on = [kubernetes_namespace.kong]
}
