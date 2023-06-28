terraform {
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.5.0"
    }
  }

  backend "local" {
  }
}

provider "aws" {
  region = "us-east-1"
}

## MAIN ##
module "s3-website" {
  source           = "../"
  bucket-name      = "my-website"
  common_tags      = { "Test" = "True" }
  upload_directory = "${path.module}/website-static-data/"
}

## OUTPUT ##
output "Endpoint" {
  value = module.s3-website.website-endpoint
}
