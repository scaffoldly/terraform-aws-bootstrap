module "aws_logging" {
  source  = "scaffoldly/logging/aws"
  version = "1.0.2"

  organization = var.organization
  root_email   = var.root_email
}

module "aws_api_gateway" {
  source  = "scaffoldly/api-gateway/aws"
  version = "1.0.2"

  subdomain = var.serverless_api_subdomain
  stages    = var.stages

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.aws_logging
  ]
}
