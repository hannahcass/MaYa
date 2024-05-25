resource "aws_api_gateway_method_response" "tfer--xbsazyawk9-002F-3xf8ig-002F-OPTIONS-002F-200" {
  http_method = "OPTIONS"
  resource_id = "3xf8ig"

  response_models = {
    "application/json" = "Empty"
  }

  rest_api_id = "xbsazyawk9"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "tfer--xbsazyawk9-002F-9jn703-002F-GET-002F-200" {
  http_method = "GET"
  resource_id = "9jn703"

  response_models = {
    "application/json" = "Empty"
  }

  rest_api_id = "xbsazyawk9"
  status_code = "200"
}
