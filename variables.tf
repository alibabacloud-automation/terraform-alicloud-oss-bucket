variable "bucket_name" {
  type    = "string"
}

variable "acl" {
  type    = "string"
  default = "private"
}

variable "website" {
  type = "list"
}

variable "logging" {
  type = "list"
}

variable "logging_isenable" {
  type = "string"
}

variable "referer_config" {
  type = "list"
}

variable "lifecycle_rule" {
  type = "list"
}
