variable "bucket_name" {
  type    = "string"
}

variable "acl" {
  type    = "string"
  default = "private"
}

variable "website" {
  type    = "list"
  default = [] 
}

variable "logging" {
  type    = "list"
  default = []
}

variable "logging_isenable" {
  type    = "string"
  default = ""
}

variable "referer_config" {
  type    = "list"
  default = []
}

variable "lifecycle_rule" {
  type    = "list"
  default = []
}
