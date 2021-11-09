module "aws_logging" {
  source  = "scaffoldly/logging/aws"
  version = "1.0.5"

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
  version = "1.0.8"

  subdomain = var.serverless_api_subdomain
  stages    = var.stages

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.aws_logging
  ]
}

module "aws_cdn" {
  source  = "scaffoldly/certificate/aws"
  version = "1.0.2"

  for_each = var.stages

  stage   = each.key
  domains = each.value.cdn_domains == null ? [] : each.value.cdn_domains

  providers = {
    aws.dns = aws.root
  }
}
