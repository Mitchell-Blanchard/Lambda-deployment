resource "aws_iam_policy" "lambda_monitor_policy" {
  name        = "lambda_monitor_policy"
  description = "Policy used to give permissions to investigate javascriptAPI"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "applicationinsights:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": "logs:*",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-southeast-2:250047729635:log-group:/aws/lambda/javascriptApi:*"
    },
    {
      "Action": "cloudwatch:*",
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": "logs:DescribeLogGroups",
      "Effect": "Allow",
      "Resource": "arn:aws:logs:ap-southeast-2:250047729635:log-group::log-stream:"
    },
    {
      "Action": "apigateway:GET",
      "Effect": "Allow",
      "Resource": "arn:aws:apigateway:ap-southeast-2::*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "lambda_support_policy_attach" {
  user       = "lambda_support_user"
  policy_arn = aws_iam_policy.lambda_monitor_policy.arn
}

resource "aws_iam_user_policy_attachment" "lambda_support_AWSCloudFormationReadOnlyAccess" {
  user       = "lambda_support_user"
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationReadOnlyAccess"
}

resource "aws_iam_user_policy_attachment" "lambda_support_LambdaReadOnlyAccess" {
  user       = "lambda_support_user"
  policy_arn = "arn:aws:iam::aws:policy/AWSLambda_ReadOnlyAccess"
}