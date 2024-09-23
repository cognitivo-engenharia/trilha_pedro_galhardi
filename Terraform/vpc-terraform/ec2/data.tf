data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "primarily-solely-constantly-massive-amoeba-dev"
    key    = "dev/vpc/terraform.tfstate"
    region = "us-east-1"
    profile = "default"
  }
}
