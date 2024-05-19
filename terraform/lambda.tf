locals {
  lambda_function_definitions = {
    api-caller = {
      create             = true
      create_role        = false
      lambda_role        = "arn:aws:iam::471112978822:role/lambda_role"
      attach_policies    = true
      number_of_policies = 1
      policies           = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"]
      function_name      = "api-caller"
      handler            = "api_caller.app.lambda_handler"
      runtime            = "python3.10"
      memory_size        = 128
      timeout            = 15
      source_path = [
        {
          path             = "${var.path_to_root}scripts/lambda/api-caller/src"
          pip_requirements = "${var.path_to_root}scripts/lambda/api-caller/requirements.txt",
        }
      ]
      build_in_docker = true
    }
  }

}

module "lambda" {
  source   = "terraform-aws-modules/lambda/aws"
  version  = "7.4.0"
  for_each = local.lambda_function_definitions

  publish = true

  create             = lookup(each.value, "create", true)
  create_role        = lookup(each.value, "create_role", false)
  lambda_role        = each.value.lambda_role
  attach_policies    = lookup(each.value, "attach_policies", false)
  number_of_policies = lookup(each.value, "number_of_policies", 0)
  function_name      = each.value.function_name
  handler            = lookup(each.value, "handler", "")
  runtime            = lookup(each.value, "runtime", "")
  memory_size        = lookup(each.value, "memory_size", 128)
  source_path        = lookup(each.value, "source_path", null)
  build_in_docker    = lookup(each.value, "build_in_docker", false)
  timeout            = lookup(each.value, "timeout", 5)
}


resource "aws_lambda_alias" "api-caller-alias" {
  name             = "api-caller-alias"
  description      = "alias for api-caller"
  function_name    = module.lambda["api-caller"].lambda_function_arn
  function_version = module.lambda["api-caller"].lambda_function_version

  depends_on = [module.lambda]
}

resource "aws_lambda_permission" "from_eventbridge" {
  statement_id  = "EventBridgePermission"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_alias.api-caller-alias.arn
  principal     = "events.amazonaws.com"
  source_arn    = module.eventbridge["api-caller-scheduler"].eventbridge_rule_arns["crons"]
}