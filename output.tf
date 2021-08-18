output "region" {
  value = var.region
}

output "role" {
  value = "arn:aws:iam::${var.account_id}:role/${var.root_email}"
}

output "api_gateway_stages" {
  value = module.aws_api_gateway.api_gateway_stages
}
