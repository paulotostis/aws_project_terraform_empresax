resource "kubernetes_secret" "cert_manager_route53_key" {
  metadata {
    name      = "route53-iam-secret"
    namespace = "cert-manager"
  }

  data = {
    api_key = var.route53.secret_key
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations
    ]
  }
}

resource "tls_private_key" "cert_manager_letsencrypt_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "kubernetes_secret" "cert_manager_letsencrypt_key" {
  metadata {
    name      = "letsencrypt"
    namespace = "cert-manager"
  }

  data = {
    key = tls_private_key.cert_manager_letsencrypt_key.private_key_pem
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations
    ]
  }
}

resource "kubectl_manifest" "cert_manager_issuer_http" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-http
spec:
  acme:
    email: ${var.route53.acme_email}
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: ${kubernetes_secret.cert_manager_letsencrypt_key.metadata[0].name}
      key: key
    solvers:
      - http01:
          ingress: {}
YAML
}

resource "kubectl_manifest" "cert_manager_issuer_route53" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: route53
spec:
  acme:
    email: ${var.route53.acme_email}
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: ${kubernetes_secret.cert_manager_letsencrypt_key.metadata[0].name}
      key: key
    solvers:
      - dns01:
          route53:
            region: ${var.route53.region}
            accessKeyID: ${var.route53.access_key}
            secretAccessKeySecretRef:
              name: ${kubernetes_secret.cert_manager_route53_key.metadata[0].name}
              key: api_key
  YAML

  depends_on = [kubernetes_secret.cert_manager_route53_key]
}

resource "kubectl_manifest" "wildcard_empresax_com_secret" {
  yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
  name: cert-empresax-com
  annotations:
    replicator.v1.mittwald.de/replication-allowed: "true"
    replicator.v1.mittwald.de/replication-allowed-namespaces: ".*"
YAML
}

resource "kubectl_manifest" "wildcard_empresax_com_certificate" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: wildcard-empresax-com
spec:
  dnsNames:
    - "*.empresax.com"
    - empresax.com
  issuerRef:
    group: cert-manager.io
    kind: ClusterIssuer
    name: route53
  secretName: cert-empresax-com
YAML

  depends_on = [kubectl_manifest.wildcard_empresax_com_secret]
}
