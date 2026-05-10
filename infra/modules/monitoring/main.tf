resource "aws_cloudwatch_metric_alarm" "cloudfront_5xx_errors" {
  alarm_name          = "${var.name_prefix}-cf-5xx-errors"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = "300"
  statistic           = "Average"
  threshold           = "1" # 1% error rate
  alarm_description   = "Threshold exceeded for CloudFront 5xx error rate"
  
  dimensions = {
    DistributionId = var.cloudfront_distribution_id
    Region         = "Global"
  }

  treat_missing_data = "notBreaching"
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.name_prefix}-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/CloudFront", "Requests", "DistributionId", var.cloudfront_distribution_id, "Region", "Global"]
          ]
          period = 300
          stat   = "Sum"
          region = "us-east-1"
          title  = "Total Requests"
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/CloudFront", "5xxErrorRate", "DistributionId", var.cloudfront_distribution_id, "Region", "Global"]
          ]
          period = 300
          stat   = "Average"
          region = "us-east-1"
          title  = "5xx Error Rate (%)"
        }
      }
    ]
  })
}
