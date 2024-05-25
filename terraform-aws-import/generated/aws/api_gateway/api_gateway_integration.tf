resource "aws_api_gateway_integration" "tfer--xbsazyawk9-002F-3xf8ig-002F-OPTIONS" {
  cache_namespace      = "3xf8ig"
  connection_type      = "INTERNET"
  http_method          = "OPTIONS"
  passthrough_behavior = "WHEN_NO_MATCH"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }

  resource_id          = "3xf8ig"
  rest_api_id          = "xbsazyawk9"
  timeout_milliseconds = "29000"
  type                 = "MOCK"
}

resource "aws_api_gateway_integration" "tfer--xbsazyawk9-002F-9jn703-002F-GET" {
  cache_namespace         = "9jn703"
  connection_type         = "INTERNET"
  content_handling        = "CONVERT_TO_TEXT"
  http_method             = "GET"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_MATCH"
  resource_id             = "9jn703"
  rest_api_id             = "xbsazyawk9"
  timeout_milliseconds    = "29000"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:eu-central-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-central-1:471112978822:function:api-caller/invocations"
}
