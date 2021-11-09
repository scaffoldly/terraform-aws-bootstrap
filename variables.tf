variable "root_email" {
  type = string
}

variable "account_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "organization" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "serverless_api_subdomain" {
  type    = string
  default = "sly"
}

variable "stages" {
  type = map(
    object({
      domain           = string
      subdomain_suffix = optional(string)
      env_vars         = optional(map(string))
      cdn_domains      = optional(list(string))
    })
  )
}

