// create new bucket 
module "oss-bucket" {
  source      = "../../"
  bucket_name = var.bucket_name
  acl         = var.acl

  website = var.website

  logging = [
    {
      target_bucket = var.bucket_name
      target_prefix = "log/"
    },
  ]

  referer_config = var.referer_config

  lifecycle_rule = var.lifecycle_rule

  policy = var.policy

}
