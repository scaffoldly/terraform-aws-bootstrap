locals {
  aws_region = "us-east-1"

  api_subdomain = "api"

  stages = ["nonlive", "live"]

  nonlive = {
    domain = "scaffoldly.dev"
  }

  live = {
    domain = "scaffold.ly"
  }

  serverless_apis = {
    example = {}
  }
}
