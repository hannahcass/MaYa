locals {
  eventbridge_rule_definitions = {
    api-caller-scheduler = {
      bus_name = "api-caller-bus"

      attach_lambda_policy = false
      lambda_target_arns   = ["arn:aws:lambda:eu-central-1:471112978822:function:api-caller"]

      schedules = {
        lambda-cron = {
          description         = "Rule to trigger lambda daily"
          schedule_expression = "rate(1 day)"
          timezone            = "UTC"
          arn                 = "arn:aws:lambda:eu-central-1:471112978822:function:api-caller"
          input               = jsonencode({ "job" : "cron-by-rate" })
        }
      }
    }
  }

}


module "eventbridge" {
  source   = "terraform-aws-modules/eventbridge/aws"
  version  = "3.3.1"
  for_each = local.eventbridge_rule_definitions

  bus_name             = lookup(each.value, "bus_name", "")
  attach_lambda_policy = lookup(each.value, "attach_lambda_policy", false)
  lambda_target_arns   = lookup(each.value, "lambda_target_arn", [])
  schedules            = lookup(each.value, "schedules", {})
}



