locals {
  sns_function_definitions = {
    maya-recs-sns = {
      create = true
      name   = "maya-recs-sns"
      tags = {
        Name = "maya-recs-sns"
      }
      create_subscription = false
      create_topic_policy = false
      delivery_policy     = null
      display_name        = null
    }
  }

}


module "sns" {
  source   = "terraform-aws-modules/sns/aws"
  version  = "6.0.1"
  for_each = local.sns_function_definitions

  create              = lookup(each.value, "create", true)
  name                = lookup(each.value, "name", "")
  tags                = lookup(each.value, "tags", {})
  create_subscription = lookup(each.value, "create_subscription", false)
  create_topic_policy = lookup(each.value, "create_topic_policy", false)
  delivery_policy     = lookup(each.value, "delivery_policy", null)
  display_name        = lookup(each.value, "display_name", null)
}