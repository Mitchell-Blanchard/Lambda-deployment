resource "aws_cloudfront_distribution" "lambda_distribution" {
  enabled = true
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  origin {
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only" #check, change to match view
      origin_ssl_protocols   = ["TLSv1.2"]
    }

    domain_name = "${aws_apigatewayv2_api.lambda.id}.execute-api.ap-southeast-2.amazonaws.com"
    origin_id = "jsAPI"
  }

  default_cache_behavior {
    allowed_methods  = ["HEAD", "GET"]
    cached_methods   = ["HEAD", "GET"]
    target_origin_id = "jsAPI"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }
}