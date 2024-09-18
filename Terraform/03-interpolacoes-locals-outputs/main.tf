terraform {


  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {

  region  = var.aws_region
  profile = var.aws_profile

}