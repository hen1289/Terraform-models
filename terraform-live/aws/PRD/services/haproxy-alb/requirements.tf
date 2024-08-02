terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  cloud {
    organization = "dot-digital-group"

    workspaces {
      name = "alb-haproxy"
    }
  }
}
