locals {
  dynamodb_table_definition = {
    "moviesdb-raw" = {
      create_table = true
      name         = "moviesdb-raw"
      hash_key     = "title"
      attributes = [
        { name = "title"
        type = "S" }
      ]
      deletion_protection_enabled = true
      billing_mode                = "PROVISIONED"
    }
  }
}

module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"
  version  = "4.0.1"
  for_each = "local.dynamodb_table_definition"

  name                        = each.value.name
  create_table                = lookup(each.value, "create_table", false)
  hash_key                    = lookup(each.value, "hash_key", null)
  range_key                   = lookup(each.value, "range_key", null)
  attributes                  = lookup(each.value, "attributes", [])
  tags                        = lookup(each.value, "tags", {})
  deletion_protection_enabled = lookup(each.value, "deletion_protection_enabled", true)
  import_table                = lookup(each.value, "import_table", {})
  billing_mode                = lookup(each.value, "billing_mode", "PROVISIONED")


}