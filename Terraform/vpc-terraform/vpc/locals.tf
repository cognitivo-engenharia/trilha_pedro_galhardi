locals {

  ip_filepath = "ips.json"

  common_tags = {
    Service     = "Gerar 2 Remotes States"
    ManagedBy   = "Terraform"
    Environment = var.env
    Owner       = "Pedro Galhardi"

  }
}