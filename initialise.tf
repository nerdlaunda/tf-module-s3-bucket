terraform {
    required_version = ">=1.5.1"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.5.0"
        }
    }

    backend "s3" {
        bucket = "295232774059-tfstate"
        key    = "s3-website/terraform.tfstate"
        region = "ap-south-1"
    }
}

provider "aws" {
    region = "ap-south-1"
}