variable "name_prefix" {
  description = "Prefix for resources"
  type        = string
}

variable "s3_bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  type        = string
}

variable "waf_arn" {
  description = "ARN of the WAF to associate with CloudFront"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
