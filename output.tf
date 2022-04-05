output "region" {
  value       = var.region
  description = "Re-output of var.region"
}

output "role" {
  value       = "arn:aws:iam::${var.account_id}:role/${var.root_email}"
  description = "IAM role for the managed account"
}

output "api_gateway_stages" {
  value       = module.aws_api_gateway.api_gateway_stages
  description = "Output of api_gatway_stages from scaffoldly/terraform-aws-api-gateway"
}

output "stages" {
  value       = var.stages
  description = "Re-output of var.stages"
}

output "cdn_stages" {
  value = {
    for cdn in module.aws_cdn :
    cdn.stage => {
      certificate_arn  = cdn.certificate_arn
      root_domain      = lookup(var.stages[cdn.stage], "domain", "unknown-domain")
      subdomain_suffix = lookup(var.stages[cdn.stage], "subdomain_suffix", "")
      domains          = cdn.domains
    }
  }
  description = "A map of CDN stages, keyed by stage"
}

output "kms_stages" {
  value = {
    for kms in module.kms :
    kms.stage => {
      key_id    = kms.key_id
      key_alias = kms.key_alias
    }
  }
  description = "A map of KMS Keys, keyed by stage"
}

output "logs_bucket" {
  value = module.aws_logging.bucket_name
}
