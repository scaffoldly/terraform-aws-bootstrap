module "aws_logging" {
  source  = "scaffoldly/logging/aws"
  version = "1.0.4"

  organization = var.organization
  root_email   = var.root_email
}

module "kms" {
  source  = "scaffoldly/kms/aws"
  version = "1.0.3"

  for_each = var.stages

  stage = each.key

  depends_on = [
    module.aws_logging
  ]
}

module "aws_api_gateway" {
  source  = "scaffoldly/api-gateway/aws"
  version = "1.0.5"

  subdomain = var.serverless_api_subdomain
  stages    = var.stages

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.aws_logging
  ]
}
