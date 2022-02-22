resource "aws_iam_user" "ramiro_cavalcanti" {
  name = "ramiro-cavalcanti"
}

resource "aws_iam_user_policy_attachment" "ec2_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_user_policy_attachment" "rds_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_iam_user_policy_attachment" "marketplace_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/AWSMarketplaceFullAccess"
}

resource "aws_iam_user_policy_attachment" "optimizer_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/ComputeOptimizerReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "elasticache_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElastiCacheFullAccess"
}

resource "aws_iam_user_policy_attachment" "filesystem_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
}

resource "aws_iam_user_policy_attachment" "backup_full_access_attachment" {
  user       = aws_iam_user.ramiro_cavalcanti.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupFullAccess"
}

