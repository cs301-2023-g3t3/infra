

resource "aws_api_gateway_rest_api" "this" {
  api_key_source               = "HEADER"
  binary_media_types           = []
  body                         = null
  description                  = null
  disable_execute_api_endpoint = false
  fail_on_warnings             = null
  minimum_compression_size     = null
  name                         = "LambdaIntegration"
  parameters                   = null
  policy                       = null
  put_rest_api_mode            = "overwrite"
  tags                         = {}
  tags_all                     = {}
  endpoint_configuration {
    types            = ["REGIONAL"]
  }
}




