data "aws_region" "current" {}

data "aws_iam_policy_document" "external_secrets" {
  statement {
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds"
    ]
    resources = [
      "*",
    ]
    effect = "Allow"
  }

  statement {
    actions = [
      "ssm:GetParameter"
    ]
    resources = [
      "*",
    ]
    effect = "Allow"
  }

}

resource "aws_iam_policy" "external_secrets" {
  name        = "external-secrets"
  path        = "/"
  description = "Policy for external secrets service"

  policy = data.aws_iam_policy_document.external_secrets.json
}

# Role
data "aws_iam_policy_document" "external_secrets_assume" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [module.eks.cluster_oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:external-secrets",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "external_secrets" {
  name               = "external-secrets"
  assume_role_policy = data.aws_iam_policy_document.external_secrets_assume.json
}

resource "aws_iam_role_policy_attachment" "external_secrets" {
  role       = aws_iam_role.external_secrets.name
  policy_arn = aws_iam_policy.external_secrets.arn
}

resource "helm_release" "external_secrets" {
  name       = "kubernetes-external-secrets"
  chart      = "kubernetes-external-secrets"
  version    = local.version_external_secrets
  repository = local.helm_repository_external_secrets
  namespace  = "kube-system"

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "env.AWS_REGION"
    value = data.aws_region.current.name
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = "external-secrets"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.external_secrets.arn
  }

  set {
    name  = "securityContext.fsGroup"
    value = 65534
  }

  set {
    name  = "customResourceManagerDisabled"
    value = true
  }
}
