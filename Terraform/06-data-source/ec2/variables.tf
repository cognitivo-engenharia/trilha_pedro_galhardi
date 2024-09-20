variable "aws_region" {

  type        = string
  description = ""
  default     = "us-east-1"

}
variable "env" {}

variable "instance_ami" {
  type = string
  description = ""
  default = ""

}

variable "instance_type" {

  type        = string
  description = ""
  default       = "t3.micro"

}