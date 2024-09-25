data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket  = "repeatedly-urgently-mentally-charmed-clam"
    key     = "vpc/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}
