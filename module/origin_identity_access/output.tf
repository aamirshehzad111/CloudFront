output "origin_access_identity" {
  value = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
}

output "s3_canonical_user_id" {
  value = "${aws_cloudfront_origin_access_identity.origin_access_identity.s3_canonical_user_id}"
}
