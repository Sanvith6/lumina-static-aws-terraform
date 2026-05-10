terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # Note: In a real enterprise scenario, backend would be configured here
  backend "s3" {
    bucket = "lumina-tf-state-pya8p8"
    key    = "prod/static-site/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

locals {
  project_id = "${var.project_name}-${random_string.suffix.result}"
}

# 1. WAF Module
module "waf" {
  source      = "./modules/waf"
  name_prefix = local.project_id
  tags        = var.common_tags
}

# 2. CloudFront Module (Depends on WAF)
module "cloudfront" {
  source                         = "./modules/cloudfront"
  name_prefix                    = local.project_id
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
  waf_arn                        = module.waf.waf_arn
  tags                           = var.common_tags
}

# 3. S3 Module (Depends on CloudFront for OAC Policy)
module "s3" {
  source                      = "./modules/s3"
  bucket_name                 = "${local.project_id}-${var.environment}-assets"
  cloudfront_distribution_arn = module.cloudfront.distribution_arn
  tags                        = var.common_tags
}

# 4. Monitoring Module
module "monitoring" {
  source                     = "./modules/monitoring"
  name_prefix                = local.project_id
  cloudfront_distribution_id = module.cloudfront.distribution_id
}
