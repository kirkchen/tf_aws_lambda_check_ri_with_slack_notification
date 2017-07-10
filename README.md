# Scheduled AWS Reserved Instance Checker function
=============================

This module can be used to deploy an AWS Lambda function which is scheduled to check is there any resource not included in active reserved instances and send notification to slack

Module Input Variables
----------------------

- `lambda_name` - Unique name for Lambda function
- `schedule_expression` - a [valid rate or cron expression](http://docs.aws.amazon.com/lambda/latest/dg/tutorial-scheduled-events-schedule-expressions.html)
- `webhook_url` - url for sending check result to slack.
- `region` - (optional) the region which wants to check reserved instances status.
- `timeout` - (optional) the amount of time your Lambda Function has to run in seconds. Defaults to 3. See [Limits](https://docs.aws.amazon.com/lambda/latest/dg/limits.html)

Usage 
-----

```js
module "lambda_scheduled" {
  source              = "github.com/kirkchen/tf_aws_lambda_check_ri_with_slack_notification"
  lambda_name         = "lambda_reserved_instance_checker"
  schedule_expression = "cron(0 6 * * 3 *)"
  webhook_url = "your_slack_webhook_url"
}
```

Outputs
-------
- `lambda_arn` - ARN for the created Lambda function

Author
------
Created and maintained by [Kirk Chen](https://github.com/kirkchen)