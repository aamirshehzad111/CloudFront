resource "aws_cloudfront_distribution" "www_distribution" {

  dynamic "origin" {
    for_each = var.custom_origin_config
    content {

      domain_name = "${origin.value}"
      origin_id = origin.value

      custom_origin_config {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    }


  }

  dynamic "origin" {

    for_each = var.dynamic_s3_origin_config
    content {

      domain_name = "${origin.value}"
      origin_id = origin.value
            s3_origin_config {
              origin_access_identity = var.origin_access_identity
            }
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "cloufront OAI"
  default_root_object = "index.html"

  default_cache_behavior {

    allowed_methods  = ["HEAD","GET"]
    cached_methods   = ["HEAD","GET"]
    target_origin_id = var.dynamic_s3_origin_config["origin1"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 300
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    owner = var.owner
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

