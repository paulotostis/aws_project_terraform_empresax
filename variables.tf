variable "betteruptime_api_token" {
  description = "Better Uptime API token"
  type        = string
  sensitive   = true
}

variable "aws_root_access_key" {
  description = "AWS Root Terraform user Access Key ID"
  type        = string
}

variable "aws_root_secret_key" {
  description = "AWS Root Terraform user Secret Key ID"
  type        = string
  sensitive   = true
}

variable "acme_email" {
  description = "ACME certificate transparency email"
  type        = string
}

variable "route53_iam_region" {
  description = "Route 53 IAM Region"
  type        = string
}

variable "route53_iam_access_key" {
  description = "Route 53 IAM Access Key ID"
  type        = string
}

variable "route53_iam_secret_key" {
  description = "Route 53 IAM Secret Access Key"
  type        = string
  sensitive   = true
}
