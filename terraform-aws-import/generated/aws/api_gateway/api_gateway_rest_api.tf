resource "aws_api_gateway_rest_api" "tfer--xbsazyawk9_maya-api" {
  api_key_source               = "HEADER"
  disable_execute_api_endpoint = "false"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  name = "maya-api"
}
