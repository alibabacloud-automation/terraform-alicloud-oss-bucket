variable "region" {
  description = "(Deprecated from version 1.5.0) The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "logging_isenable" {
  description = "(Deprecated from version 1.6.0) The flag of using logging enable container."
  type        = bool
  default     = true
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "acl" {
  type    = string
  default = "private"
}

variable "website" {
  type = list(object({
    index_document = string
    error_document = string
  }))
  default = []
}

variable "logging" {
  type = list(object({
    target_bucket = string
    target_prefix = string
  }))
  default = []
}

variable "referer_config" {
  type = list(object({
    allow_empty = bool
    referers    = list(string)
  }))
  default = []
}

variable "lifecycle_rule" {
  type = list(object({
    id         = string
    prefix     = string
    enabled    = bool
    expiration = list(map(string))
  }))
  default = []
}

variable "policy" {
  type    = string
  default = ""
}

