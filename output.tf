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
