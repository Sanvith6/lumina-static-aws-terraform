variable "name_prefix" {
  description = "Prefix for resources"
  type        = string
}

variable "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution to monitor"
  type        = string
}
