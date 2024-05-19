locals {
  eventbridge_rule_definitions = {
    api-caller-scheduler = {
      create_bus = false
      rules = {
        crons = {
          description         = "Rule to trigger lambda daily"
          schedule_expression = "cron(0 18 * * ? *)"
        }
      }
      targets = {
        crons = [
          {
            name = "api-caller"
            arn  = "arn:aws:lambda:eu-central-1:471112978822:function:api-caller"
        }]
      }
    }
  }

}


module "eventbridge" {
  source   = "terraform-aws-modules/eventbridge/aws"
  version  = "3.3.1"
  for_each = local.eventbridge_rule_definitions

  create_bus = lookup(each.value, "create_bus", false)
  rules      = lookup(each.value, "rules", {})
  targets    = lookup(each.value, "targets", {})
}