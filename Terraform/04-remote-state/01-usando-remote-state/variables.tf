variable "environment" {
  type        = string
  description = ""
  default     = ""
}

variable "aws_region" {

  type        = string
  description = ""
  default     = "us-east-1"

}

variable "aws_profile" {

  type        = string
  description = ""
  default     = "default"

}

variable "instance_ami" {

  type        = string
  description = ""
  default     = "ami-0b0ea68c435eb488d"

}

variable "instance_type" {

  type        = string
  description = ""
  default     = "t3.micro"

}
