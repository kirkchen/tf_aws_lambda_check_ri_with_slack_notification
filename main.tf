data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/files/lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  runtime          = "nodejs6.10"
  filename         = "${path.module}/files/lambda.zip"
  function_name    = "${var.lambda_name}"
  role             = "${aws_iam_role.lambda.arn}"
  handler          = "index.handler"
  source_code_hash = "${data.archive_file.lambda.output_base64sha256}"
  timeout          = "${var.timeout}"

  environment {
    variables = {
      RICHECKER_WEBHOOK_URL   = "${var.webhook_url}"
      RICHECKER_REGION        = "${var.region}"
      RICHECKER_SLACK_CHANNEL = "${var.slack_channel}"
      RICHECKER_EXCLUDE_PATTERN = "${var.exclude_pattern}"
    }
  }
}

