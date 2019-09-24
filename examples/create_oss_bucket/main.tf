// create new bucket 
module "oss-bucket" {
  source      = "../../"
  bucket_name = "bucket-terraform-20190105"
  acl         = "private"

  website = [
    {
      index_document = "index.html"
      error_document = "error.html"
    },
  ]

  logging = [
    {
      target_bucket = "your-existed-and-same-region-bucket"
      target_prefix = "log/"
    },
  ]

  logging_isenable = true

  referer_config = [
    {
      allow_empty = false
      referers    = ["http://www.aliyun.com", "https://www.aliyun.com"]
    },
  ]

  lifecycle_rule = [
    {
      id      = "rule-days"
      prefix  = "path1/"
      enabled = true
      expiration = [
        {
          days = 365
        },
      ]
    },
    {
      id      = "rule-date"
      prefix  = "path2/"
      enabled = true
      expiration = [
        {
          date = "2018-01-12"
        },
      ]
    },
  ]
  policy = <<POLICY
  {"Statement":
      [{"Action":
          ["oss:PutObject", "oss:GetObject", "oss:DeleteBucket"],
        "Effect":"Allow",
        "Resource":
            ["acs:oss:*:*:*"]}],
   "Version":"1"}
  
POLICY

}

