variable "aws_region" {

  type = string
  default = "us-east-1"

}

variable "aws_profile" {

  type = string
  default = "default"

}

variable "ami" {

  type = string

}

variable "instance_type" {

  type = string

}

variable "associate_public_ip_address" {

  type = bool

}

variable "instance_name" {

  type = string

}

variable "key_name" {

  type = string

}

variable "subnet_private" {

  type = string
}

variable "security_group1" {

  type = string

}

variable "security_group2" {

  type = string

}

variable "delete_on_termination" {

  type = bool

}

variable "ebs_device_name" {

  type = string

}

variable "volume_size" {

  type = string

}