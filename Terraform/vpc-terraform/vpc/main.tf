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

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "My-VPC"
  }
}
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.cidr_block_subnet
  availability_zone = var.availability_zone

  tags = {
    Name = "My-Subnet"
  }
}

resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My-Security-Group"
  }
  
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "My-Internet-Gateway"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "My-Route-Table"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}
