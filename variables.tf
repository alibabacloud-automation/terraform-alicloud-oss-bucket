variable "bucket_name" {
  type    = "string"
}

variable "acl" {
  type    = "string"
  default = "private"
}

variable "website" {
  type    = "list"
  default = null
}

variable "logging" {
  type    = "list"
  default = null
}

variable "logging_isenable" {
  type    = "string"
  default = null
}

variable "referer_config" {
  type    = "list"
  default = null
}

variable "lifecycle_rule" {
  type    = "list"
  default = null
}
