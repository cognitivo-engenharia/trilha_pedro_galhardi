data "terraform_remote_state" "server" {

  backend = "s3"

  config = {
    
    bucket = "tfstate-941377150778"
    key    = "dev/06-data-source/terraform.tfsate"
    region = "us-east-1"
    profile = "default"
    
  }

 }