resource "aws_cloudformation_stack" "anomaly_detection" {
  name          = var.name
  tags          = local.tags
  template_body = <<-STACK
    Resources:
      AnomalyMonitor${var.cost_threshold}monies:
        Type: AWS::CE::AnomalyMonitor
        Properties:
          MonitorName: 'AnomalyDetected_is_greater_than_${var.cost_threshold}_monies'
          MonitorType: 'DIMENSIONAL'
          MonitorDimension: 'SERVICE'

      AnomalySubscription:
        Type: AWS::CE::AnomalySubscription
        Properties:
          SubscriptionName: AnomalyDetected_is_greater_than_${var.cost_threshold}_monies
          Threshold: ${var.cost_threshold}
          Frequency: DAILY
          MonitorArnList:
            - !Ref AnomalyMonitor${var.cost_threshold}monies
          Subscribers:
            [
              {
                "Type": "EMAIL",
                "Address": ${var.subscription_email}
              }
            ]
  STACK
}