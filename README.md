Alicloud OSS Terraform Module On Alibaba Cloud 
terraform-alicloud-oss-bucket
=====================================================================

Terraform module which creates OSS bucket.

These types of resources are supported:

* [OSS Bucket](https://www.terraform.io/docs/providers/alicloud/r/oss_bucket.html)

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

    ```
    module "oss-bucket" {
        source     = "terraform-alicloud-modules/oss-bucket/alicloud"
        bucket_name = "just_a_test"
        acl = "private"
    }
    ```

2. Setting `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket_name | the bucket you want to create and operate | string | - | yes |
| acl | bucket acl,may be private,public-read,public-read-write,default is private | string | - | no |
| website | A website object | list | [] | no |
| logging | A Settings of bucket logging  | list | [] | no |
| logging_isenable | The flag of using logging enable container. Defaults true  | string | "true" | no |
| referer_config | The configuration of referer  | list | [] | no |
| lifecycle_rule | A configuration of object lifecycle management | list | [] | no |


## Outputs

| Name | Description |
|------|-------------|
| this_oss_bucket_id | the name of the bucket |

Authors
-------
Created and maintained by He Guimin(@xiaozhu36 or @coderall, heguimin36@163.com or lzcgwushuang@163.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
