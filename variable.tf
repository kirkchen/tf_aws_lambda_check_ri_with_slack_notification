variable "lambda_name" {}

variable "schedule_expression" {}

variable "timeout" {
  default = 30
}

variable "webhook_url" {}
variable "slack_channel" {
  default = ""
}

variable "region" {
  default = "us-east-1"
}