module "lambda-deploy" {
  source = "../module"

  lambda_function_name = "javascriptApi"
  lambda_handler       = "handler.hello"

}