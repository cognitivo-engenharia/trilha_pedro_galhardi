terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "test-tf"
}
resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-68574525"
  acl = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby = "Terraform"
  }
}