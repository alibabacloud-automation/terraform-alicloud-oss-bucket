resource "alicloud_oss_bucket" "create_new_bucket" {
  bucket           = "${var.bucket_name}"
  acl              = "${var.acl}"
  website          = "${var.website}"
  logging          = "${var.logging}"
  logging_isenable = "${var.logging_isenable}"
  referer_config   = "${var.referer_config}"
  lifecycle_rule   = "${var.lifecycle_rule}"
}
