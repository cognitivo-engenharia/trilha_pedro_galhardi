terraform{
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.7"
    }
  
  } 
  backend "s3" {
    bucket = "primarily-solely-constantly-massive-amoeba-dev"
    key    = "dev/vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
    
}
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
