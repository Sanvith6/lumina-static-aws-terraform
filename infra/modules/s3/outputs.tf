output "bucket_id" {
  value = aws_s3_bucket.this.id
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.this.bucket_regional_domain_name
}

output "logging_bucket_regional_domain_name" {
  value      = aws_s3_bucket.logging.bucket_regional_domain_name
  depends_on = [aws_s3_bucket_acl.logging]
}
