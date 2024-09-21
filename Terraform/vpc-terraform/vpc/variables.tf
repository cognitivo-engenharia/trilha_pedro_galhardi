variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_profile" {
  type = string
  default = "default"
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
variable "env" {}