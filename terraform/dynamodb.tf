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
      billing_mode   = "PROVISIONED"
      read_capacity  = 1
      write_capacity = 1
    }
  }
}

module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"
  version  = "4.0.1"
  for_each = local.dynamodb_table_definition

  name           = each.value.name
  create_table   = lookup(each.value, "create_table", false)
  hash_key       = lookup(each.value, "hash_key", null)
  range_key      = lookup(each.value, "range_key", null)
  attributes     = lookup(each.value, "attributes", [])
  tags           = lookup(each.value, "tags", {})
  import_table   = lookup(each.value, "import_table", {})
  billing_mode   = lookup(each.value, "billing_mode", "PROVISIONED")
  read_capacity  = lookup(each.value, "read_capacity", 1)
  write_capacity = lookup(each.value, "write_capacity", 1)


}