resource "aws_iam_role" "lambda" {
  name = "${var.lambda_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy_document" "describe_ec2" {
  statement {
    sid = "1"

    actions = [
      "ec2:DescribeReservedInstances",
      "ec2:DescribeInstances",
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role_policy" "lambda" {
  name = "${var.lambda_name}"
  role = "${aws_iam_role.lambda.name}"

  policy = "${data.aws_iam_policy_document.describe_ec2.json}"
}