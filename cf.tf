resource "aws_cloudfront_distribution" "main" {
  origin {
    domain_name = "${aws_s3_bucket.main.website_endpoint}"
    origin_id = "${aws_s3_bucket.main.id}"

    # s3_origin_config {
    #   origin_access_identity = "S3-${var.fqdn}"
    # }

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
  

  enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = [ "GET", "HEAD" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id = "${aws_s3_bucket.main.id}"
    viewer_protocol_policy = "redirect-to-https"
    
    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
    
    
  }

  ordered_cache_behavior {
    path_pattern = "*"
    allowed_methods = [ "GET", "HEAD" ]
    cached_methods = [ "GET", "HEAD" ]
    target_origin_id = "${aws_s3_bucket.main.id}"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
     query_string = false
     headers = ["Origin"]
     cookies {
      forward = "none"
     }
    }

    lambda_function_association {
      event_type = "viewer-request"
      lambda_arn = "${aws_lambda_function.lambda.arn}:${aws_lambda_function.lambda.version}"
      include_body = true
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}