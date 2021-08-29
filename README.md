Alicloud OSS Terraform Module On Alibaba Cloud 
terraform-alicloud-oss-bucket
=====================================================================

Terraform module which creates OSS bucket.

These types of resources are supported:

* [OSS Bucket](https://www.terraform.io/docs/providers/alicloud/r/oss_bucket.html)

--------------------

Usage
-----
The basic usage as follows:
```hcl
 module "oss-bucket" {
     source      = "terraform-alicloud-modules/oss-bucket/alicloud"
     bucket_name = "my-foo-bucket"
     acl         = "private"
 }
```

-> **NOTE:**

From the version v1.5.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
   version              = ">=1.56.0"
   region               = var.region != "" ? var.region : null
   configuration_source = "terraform-alicloud-modules/oss-bucket"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.4.0:

```hcl
 module "oss-bucket" {
   source      = "terraform-alicloud-modules/oss-bucket/alicloud"
   bucket_name = "my-foo-bucket"
   acl         = "private"

   version     = "1.4.0"
   region      = "cn-hangzhou"
}
```

If you want to upgrade the module to 1.5.0 and higher in-place, you can define a provider which same region with 
previous region:

```hcl
provider "alicloud" {
   region = "cn-hangzhou"
}
module "oss-bucket" {
   source      = "terraform-alicloud-modules/oss-bucket/alicloud"
   bucket_name = "my-foo-bucket"
   acl         = "private"
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
   region = "cn-hangzhou"
   alias  = "hz"
}
module "oss-bucket" {
   source      = "terraform-alicloud-modules/oss-bucket/alicloud"
   bucket_name = "my-foo-bucket"
   acl         = "private"

   providers = {
      alicloud = alicloud.hz
   }
}
```

and then run `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

----------------------
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.56.0 |

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
| policy | JSON formatted bucket policy text to attach to the bucket | string | "" | no |


## Outputs

| Name | Description |
|------|-------------|
| this_oss_bucket_id | the name of the bucket |

Authors
-------
Created and maintained by He Guimin(@xiaozhu36 or @coderall, heguimin36@163.com or lzcgwushuang@163.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
