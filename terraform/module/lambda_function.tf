data "archive_file" "lambda_zip" {
    type        = "zip"
    source_file  = "../../handler.js"
    output_path = "../../handler.zip"
}

resource "aws_lambda_function" "javascriptAPI_lambda" {
  filename      = "../../handler.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_function_role.arn
  handler       = var.lambda_handler
  runtime       = "nodejs14.x"
}

resource "aws_cloudwatch_log_group" "lambda_javascriptAPI_cloudwatch" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = 14
}