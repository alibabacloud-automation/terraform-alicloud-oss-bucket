acl = "public-read"

website = [
  {
    index_document = "myindex.html"
    error_document = "myerror.html"
  },
]

referer_config = [
  {
    allow_empty = true
    referers    = ["http://www.alibabacloud.com", "https://www.alibabacloud.com"]
  },
]

lifecycle_rule = [
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
