variable "bucket_name" {
  type    = string
  default = "bucket-terraform-20211216"
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
  default = [
    {
      index_document = "index.html"
      error_document = "error.html"
    },
  ]
}

variable "referer_config" {
  type = list(object({
    allow_empty = bool
    referers    = list(string)
  }))
  default = [
    {
      allow_empty = false
      referers    = ["http://www.aliyun.com", "https://www.aliyun.com"]
    },
  ]
}

variable "lifecycle_rule" {
  type = list(object({
    id         = string
    prefix     = string
    enabled    = bool
    expiration = list(map(string))
  }))
  default = [
    {
      id      = "rule-days"
      prefix  = "path1/"
      enabled = true
      expiration = [
        {
          days = 365
        },
      ]
    }
  ]
}

variable "policy" {
  type    = string
  default = <<POLICY
  {"Statement":
      [{"Action":
          ["oss:PutObject", "oss:GetObject", "oss:DeleteBucket"],
        "Effect":"Allow",
        "Resource":
            ["acs:oss:*:*:*"]}],
   "Version":"1"}

POLICY
}