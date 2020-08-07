terraform {
  required_version = ">= 0.12"
  backend "remote" {
    workspaces {
      name = "bootstrap"
    }
  }
}

provider "github" {
  version      = "~> 2.8"
  token        = var.BOOTSTRAP_GITHUB_TOKEN
  organization = data.external.git.result.organization
}

provider "external" {
  version = "~> 1.2"
}

provider "random" {
  version = "2.3.0"
}

provider "aws" {
  version = "~> 3.0.0"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "org"
  version = "~> 3.0.0"
  region  = "us-east-1" # TODO: Make this configurable

  assume_role {
    role_arn = "arn:aws:iam::${module.aws_organization.account_id}:role/BootstrapAccessRole"
  }
}
