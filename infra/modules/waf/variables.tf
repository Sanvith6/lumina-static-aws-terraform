variable "name_prefix" {
  description = "Prefix for the WAF name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the WAF"
  type        = map(string)
  default     = {}
}
