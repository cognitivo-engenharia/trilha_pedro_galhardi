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

variable "cidr_block_subnet" {
  type = string
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  type = string
  default = "us-east-1a"
}
