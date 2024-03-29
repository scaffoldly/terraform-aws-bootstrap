module "saml_to" {
  source  = "saml-to/iam/aws"
  version = "1.0.4"
  owner   = var.organization
}

resource "aws_iam_role" "administrator" {
  name               = "${var.organization}-admin"
  assume_role_policy = module.saml_to.trust_policy
}

resource "aws_iam_role_policy_attachment" "administrator" {
  role       = aws_iam_role.administrator.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

module "aws_logging" {
  source  = "scaffoldly/logging/aws"
  version = "1.0.5"

  organization = var.organization
  root_email   = var.root_email
}

module "kms" {
  source  = "scaffoldly/kms/aws"
  version = "1.0.4"

  for_each = var.stages

  stage = each.key

  depends_on = [
    module.aws_logging
  ]
}

module "aws_api_gateway" {
  source  = "scaffoldly/api-gateway/aws"
  version = "1.0.12"

  subdomain  = var.serverless_api_subdomain
  websockets = var.serverless_api_websockets
  stages     = var.stages

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.aws_logging
  ]
}

module "aws_cdn" {
  source  = "scaffoldly/certificate/aws"
  version = "1.0.9"

  for_each = var.stages

  stage            = each.key
  root_domain      = each.value.domain
  subdomains       = each.value.cdn_subdomains != null ? each.value.cdn_subdomains : []
  subdomain_suffix = each.value.subdomain_suffix != null ? each.value.subdomain_suffix : ""

  providers = {
    aws.dns = aws.root
  }
}
