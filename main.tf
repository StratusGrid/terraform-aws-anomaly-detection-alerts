resource "aws_ce_anomaly_monitor" "this" {
  count = var.enable_cost_anomaly_detection == true ? 1 : 0

  name              = "AnomalyDetected_is_greater_than_${var.cost_threshold}_monies"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"

  tags = local.tags
}

resource "aws_ce_anomaly_subscription" "this" {
  count = var.enable_cost_anomaly_detection == true ? 1 : 0

  name             = "AnomalyDetected_is_greater_than_${var.cost_threshold}_monies"
  monitor_arn_list = [aws_ce_anomaly_monitor.this[0].arn]
  frequency        = "DAILY"
  threshold_expression {
    dimension {
      key           = "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
      values        = [tostring(var.cost_threshold)]
      match_options = ["GREATER_THAN_OR_EQUAL"]
    }
  }
  subscriber {
    address = var.subscription_email
    type    = "EMAIL"
  }

  tags = local.tags
}
