variable "aws_region" {
  type = string
  default = "us-east-1"
}
variable "aws_profile" {
  type = string
  default = "default"
  
}
variable "ami" {
  type    = string
  default = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  type    = string
  default = "t2.small"
}