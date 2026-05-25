
variable "bucket_name" {
  description = "The name of the bucket"
  type    = string
  default = ""
}

variable "acl" {
  description = "The access control list of the bucket"
  type    = string
  default = "private"
}

variable "website" {
  description = "The website configuration of the bucket"
  type = list(object({
    index_document = string
    error_document = string
  }))
  default = []
}

variable "logging" {
  description = "The logging configuration of the bucket"
  type = list(object({
    target_bucket = string
    target_prefix = string
  }))
  default = []
}

variable "referer_config" {
  description = "The referer configuration of the bucket"
  type = list(object({
    allow_empty = bool
    referers    = list(string)
  }))
  default = []
}

variable "lifecycle_rule" {
  description = "The lifecycle rule of the bucket"
  type = list(object({
    id         = string
    prefix     = string
    enabled    = bool
    expiration = list(map(string))
  }))
  default = []
}

variable "policy" {
  description = "The policy of the bucket"
  type    = string
  default = ""
}

variable "cors_rule" {
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = string

  }))
  default = []
}

