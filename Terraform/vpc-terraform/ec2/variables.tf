variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "ami" {
  type    = string
  default = "ami-0aa7d40eeae50c9a9"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "subnet_id" {
  type = string
}

variable "security_group" {
  type = string
}

