output "this_oss_bucket_id" {
  description = "The name of the bucket"
  value       = element(concat(alicloud_oss_bucket.create_new_bucket.*.id, [""]), 0)
}

