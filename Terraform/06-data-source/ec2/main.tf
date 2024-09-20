terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "tfstate-941377150778"
    key    = "dev/06-data-source/terraform.tfsate"
    region = "us-east-1"
    profile = "default"
  }
  }
  provider "aws" {
    region = var.aws_region
    profile = "default"
  } 

  