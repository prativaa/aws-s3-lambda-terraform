resource "aws_lambda_permission" "allow_cloudfront" {
  statement_id   = "AllowExecutionFromCloudFront"
  action         = "lambda:GetFunction"
  function_name  = "${aws_lambda_function.lambda.function_name}"
  principal      = "edgelambda.amazonaws.com"
}


resource "aws_lambda_function" "lambda" {
  function_name = "${var.function_name}"
  role = "${aws_iam_role.lambda.arn}"
  handler = "lambda_handler"
  runtime = "nodejs8.10"
  filename = "redirect.zip"
  publish = true
}

