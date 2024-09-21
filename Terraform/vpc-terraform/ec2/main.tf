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
    bucket  = "primarily-solely-constantly-massive-amoeba-dev"
    key     = "dev/vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_iam_role_policy_attachment" "s3_access" {
  policy_arn = aws_iam_policy.s3_policy.arn
  role       = aws_iam_role.ec2_role.name
}

resource "aws_instance" "airbyte" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_group_id]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_role.ec2_role.name

  tags = {
    Name = "airbyte"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y docker
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker ec2-user
    newgrp docker
    mkdir /airbyte && cd /airbyte
    wget https://raw.githubusercontent.com/airbytehq/airbyte/master/docker-compose.yaml
    docker-compose up -d
    EOF
}
