locals {
  s3_bucket_definitions = {
    moviesdb123 = {
      bucket                  = "moviesdb-raw"
      create_bucket           = true
      block_public_acls       = true
      block_public_policy     = true
      ignore_public_acls      = true
      restrict_public_buckets = true
      versioning = {
        enabled = true
      }

    }
  }
}

module "s3-bucket" {
  source   = "terraform-aws-modules/s3-bucket/aws"
  version  = "4.1.2"
  for_each = local.s3_bucket_definitions

  bucket                  = each.value.bucket
  create_bucket           = lookup(each.value, "create_bucket", true)
  block_public_acls       = lookup(each.value, "block_public_acls", true)
  block_public_policy     = lookup(each.value, "block_public_policy", true)
  ignore_public_acls      = lookup(each.value, "ignore_public_acls", true)
  restrict_public_buckets = lookup(each.value, "restrict_public_buckets", true)
  versioning              = lookup(each.value, "versioning", {})
}