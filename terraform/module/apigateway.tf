resource "aws_apigatewayv2_api" "lambda" {
  name          = "lambda-http-javascriptapi"
  protocol_type = "HTTP"
  target        = aws_lambda_function.javascriptAPI_lambda.arn
  route_key     = "GET /"
}

resource "aws_lambda_permission" "lambda_apigw_permissions" {
	action        = "lambda:InvokeFunction"
	function_name = aws_lambda_function.javascriptAPI_lambda.arn
	principal     = "apigateway.amazonaws.com"

	source_arn    = "${aws_apigatewayv2_api.lambda.execution_arn}/*/*"
}