resource "alicloud_oss_bucket" "create_new_bucket" {
  bucket = var.bucket_name
  acl    = var.acl
  dynamic "website" {
    for_each = var.website
    content {
      error_document = lookup(website.value, "error_document", null)
      index_document = website.value.index_document
    }
  }
  dynamic "logging" {
    for_each = var.logging
    content {
      target_bucket = logging.value.target_bucket
      target_prefix = lookup(logging.value, "target_prefix", null)
    }
  }

  dynamic "referer_config" {
    for_each = var.referer_config
    content {
      allow_empty = lookup(referer_config.value, "allow_empty", null)
      referers    = referer_config.value.referers
    }
  }
  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule
    content {
      enabled = lifecycle_rule.value.enabled
      id      = lookup(lifecycle_rule.value, "id", null)
      prefix  = lifecycle_rule.value.prefix

      dynamic "expiration" {
        for_each = lookup(lifecycle_rule.value, "expiration", [])
        content {
          date = lookup(expiration.value, "date", null)
          days = lookup(expiration.value, "days", null)
        }
      }
    }
  }
  policy = var.policy
  dynamic "cors_rule" {
    for_each = var.cors_rule
    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods 
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_secondss 
    }
  }
}
