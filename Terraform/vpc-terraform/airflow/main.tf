terraform{
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.7"
    }
  
  } 
  backend "s3" {
    bucket  = "loosely-currently-hugely-causal-impala-dev"
    key     = "vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
    
}
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
resource "aws_instance" "airflow" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]

  associate_public_ip_address = true

  key_name = "airflow"

  tags = {
    Name = "airflow"
  }

}
