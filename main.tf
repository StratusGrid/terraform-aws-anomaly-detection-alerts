resource "aws_ce_anomaly_monitor" "this" {
  name              = "AnomalyDetected_is_greater_than_${var.cost_threshold}_monies"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"

  tags = local.tags
}

resource "aws_ce_anomaly_subscription" "this" {
  name             = "AnomalyDetected_is_greater_than_${var.cost_threshold}_monies"
  monitor_arn_list = [aws_ce_anomaly_monitor.this.arn]
  frequency        = "DAILY"
  threshold        = var.cost_threshold
  subscriber {
    address = var.subscription_email
    type    = "EMAIL"
  }

  tags = local.tags
}