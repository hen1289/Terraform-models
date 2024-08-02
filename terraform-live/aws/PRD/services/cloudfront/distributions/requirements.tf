terraform {
  cloud {
    organization = "dot-digital-group"

    workspaces {
      name = "Distributions"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1"
}