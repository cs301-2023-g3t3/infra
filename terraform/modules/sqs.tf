
resource "aws_sqs_queue" "maker_checker_dlq" {
  content_based_deduplication       = false
  deduplication_scope               = null
  delay_seconds                     = 0
  fifo_queue                        = false
  fifo_throughput_limit             = null
  kms_data_key_reuse_period_seconds = 300
  kms_master_key_id                 = null
  max_message_size                  = 262144
  message_retention_seconds         = 1209600
  name                              = "makerchecker-dlq"
  name_prefix                       = null
  policy                            = "{\"Id\":\"__default_policy_ID\",\"Statement\":[{\"Action\":\"SQS:*\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::345215350058:root\"},\"Resource\":\"arn:aws:sqs:ap-southeast-1:345215350058:makerchecker-dlq\",\"Sid\":\"__owner_statement\"}],\"Version\":\"2012-10-17\"}"
  receive_wait_time_seconds         = 0
  redrive_allow_policy              = null
  redrive_policy                    = null
  sqs_managed_sse_enabled           = true
  tags                              = {}
  tags_all                          = {}
  visibility_timeout_seconds        = 30
}

resource "aws_sqs_queue" "maker_checker" {
  content_based_deduplication       = false
  deduplication_scope               = null
  delay_seconds                     = 0
  fifo_queue                        = false
  fifo_throughput_limit             = null
  kms_data_key_reuse_period_seconds = 300
  kms_master_key_id                 = null
  max_message_size                  = 262144
  message_retention_seconds         = 345600
  name                              = "makerchecker"
  name_prefix                       = null
  policy                            = "{\"Id\":\"__default_policy_ID\",\"Statement\":[{\"Action\":\"SQS:*\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":[\"arn:aws:iam::345215350058:root\",\"arn:aws:iam::345215350058:role/lambda-execution-role\"]},\"Resource\":\"arn:aws:sqs:ap-southeast-1:345215350058:makerchecker\",\"Sid\":\"__owner_statement\"}],\"Version\":\"2012-10-17\"}"
  receive_wait_time_seconds         = 0
  redrive_allow_policy              = null
  redrive_policy                    = "{\"deadLetterTargetArn\":\"arn:aws:sqs:ap-southeast-1:345215350058:makerchecker-dlq\",\"maxReceiveCount\":10}"
  sqs_managed_sse_enabled           = true
  tags                              = {}
  tags_all                          = {}
  visibility_timeout_seconds        = 30
}
