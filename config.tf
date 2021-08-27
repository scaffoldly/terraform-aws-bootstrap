terraform {
  required_version = ">= 1.0.0, < 1.1.0"
  experiments      = [module_variable_optional_attrs]

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.root]
    }
  }
}

provider "aws" {
  # Used for DNS and Role Assumption, which are global services, so us-east-1 is hard-coded
  alias  = "root"
  region = "us-east-1"
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/${var.root_email}"
  }
}
