# Scaffoldly Terraform Bootstrap Project

[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-scaffoldly-bootstrap)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

# About

Used in tandem with the [Bootstrap Template](https://github.com/scaffoldly/bootstrap-template) during Scaffoldly Bootstrapping.

See the [Docs](https://docs.scaffold.ly) and [Scaffoldly Start](https://start.scaffold.ly) to use this module.

# Usage

See [scaffoldly/bootstrap-template](https://github.com/scaffoldly/bootstrap-template/blob/main/main.tf)

# Examples

- [Scaffoldly Demo](https://github.com/scaffoldly-demo/scaffoldly-bootstrap)
- [Futz.dev](https://github.com/futz-dev/scaffoldly-bootstrap) (Scaffoldly Upstream Development)

# Terraform Docs

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 1.1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_api_gateway"></a> [aws\_api\_gateway](#module\_aws\_api\_gateway) | scaffoldly/api-gateway/aws | 1.0.8 |
| <a name="module_aws_cdn"></a> [aws\_cdn](#module\_aws\_cdn) | scaffoldly/certificate/aws | 1.0.1 |
| <a name="module_aws_logging"></a> [aws\_logging](#module\_aws\_logging) | scaffoldly/logging/aws | 1.0.5 |
| <a name="module_kms"></a> [kms](#module\_kms) | scaffoldly/kms/aws | 1.0.3 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_root_email"></a> [root\_email](#input\_root\_email) | n/a | `string` | n/a | yes |
| <a name="input_serverless_api_subdomain"></a> [serverless\_api\_subdomain](#input\_serverless\_api\_subdomain) | n/a | `string` | `"sly"` | no |
| <a name="input_stages"></a> [stages](#input\_stages) | n/a | <pre>map(<br>    object({<br>      domain           = string<br>      subdomain_suffix = optional(string)<br>      env_vars         = optional(map(string))<br>      cdn_domains      = optional(list(string))<br>    })<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_stages"></a> [api\_gateway\_stages](#output\_api\_gateway\_stages) | Output of api\_gatway\_stages from scaffoldly/terraform-aws-api-gateway |
| <a name="output_cdn_stages"></a> [cdn\_stages](#output\_cdn\_stages) | A map of CDN stages, keyed by stage |
| <a name="output_logs_bucket"></a> [logs\_bucket](#output\_logs\_bucket) | n/a |
| <a name="output_region"></a> [region](#output\_region) | Re-output of var.region |
| <a name="output_role"></a> [role](#output\_role) | IAM role for the managed account |
| <a name="output_stages"></a> [stages](#output\_stages) | Re-output of var.stages |
<!-- END_TF_DOCS -->

# Contributing

We'd love your contributions. Start [here](https://docs.scaffold.ly/contributing)

# Copyrights

Copyright © 2021 Scaffoldly LLC
