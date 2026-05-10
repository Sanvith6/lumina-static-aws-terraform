variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "lumina-static"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project   = "Lumina-Static"
    ManagedBy = "Terraform"
    Tier      = "Frontend"
  }
}
