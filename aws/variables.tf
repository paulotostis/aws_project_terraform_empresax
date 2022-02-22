variable "aws_root_credentials" {
  description = "AWS Root Terraform Credentials"

  type = object({
    access_key = string
    secret_key = string
  })
}

variable "route53" {
  description = "Route 53 Global Settings"

  type = object({
    acme_email = string
    region     = string
    access_key = string
    secret_key = string
  })

  sensitive = true
}
