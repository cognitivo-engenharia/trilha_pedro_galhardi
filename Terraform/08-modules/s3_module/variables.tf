variable "name" {
  type = string
  description = "Bucket Name"
}

variable "acl" {
  type = string
  description = ""
  default = "private"
}

variable "policy" {
  type = string
  description = ""
  default = null
}

variable "tags" {
  type = map(string)
  description = ""
  default = {}
}

variable "website" {
  description = "Map containing website configuration"
  type = map(string)
  default = {}
  
  }
  
