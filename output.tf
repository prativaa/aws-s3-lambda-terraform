output "s3_bucket_id" {
 value = "${aws_s3_bucket.main.id}"
}

output "s3_bucket_endpoint" {
 value = "${aws_s3_bucket.main.website_endpoint}"
}

output "s3_bucket_arn" {
 value = "${aws_s3_bucket.main.arn}"
}

output "lambda_arn" {
  value = "${aws_lambda_function.lambda.arn}"
}

output "lambda_version" {
  value = "${aws_lambda_function.lambda.version}"
}

output "cloudfront_id" {
  value = "${aws_cloudfront_distribution.main.id}"
}

