variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "bucket_name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}

variable "website" {
  type    = list(object({
    index_document = string
    error_document = string
  }))
  default = []
}

variable "logging" {
  type    = list(object({
    target_bucket = string
    target_prefix = string
  }))
  default = []
}

variable "logging_isenable" {
  type    = bool
  default = false
}

variable "referer_config" {
  type    = list(object({
    allow_empty = bool
    referers    = list(string)
  }))
  default = []
}

variable "lifecycle_rule" {
  type    = list(object({
    id      = string
    prefix  = string
    enabled = bool
    expiration = list(map(string))
  }))
  default = []
}

variable "policy" {
  type    = string
  default = ""
}

