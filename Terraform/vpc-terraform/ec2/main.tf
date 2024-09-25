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
    backend "s3" {
    bucket  = "repeatedly-urgently-mentally-charmed-clam"
    key     = "vpc/airbyte/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "airbyte" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]

  associate_public_ip_address = true

  key_name = "airbyte"

  tags = {
    Name = "airbyte"
  }
}
