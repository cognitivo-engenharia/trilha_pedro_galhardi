data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket  = "loosely-currently-hugely-causal-impala-dev"
    key     = "vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}