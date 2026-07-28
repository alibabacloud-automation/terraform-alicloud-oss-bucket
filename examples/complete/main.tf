# create new bucket
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

locals {
  bucket_name = "${var.bucket_name}-${random_string.suffix.result}"
}

module "oss-bucket" {
  source      = "../../"
  bucket_name = local.bucket_name

  website = var.website

  logging = [
    {
      target_bucket = local.bucket_name
      target_prefix = "log/"
    },
  ]

  referer_config = var.referer_config

  lifecycle_rule = var.lifecycle_rule

  policy = var.policy

}
