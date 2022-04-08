resource "aws_iam_role" "example_resource" {
  name               = var.name # <= You may need to append to the name string in a name field to avoid conflicts
  assume_role_policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
   ]
}
EOF

  tags = local.tags # <= Note the use of local.tags
}

resource "aws_cloudformation_stack" "anomaly_detection" {
  name          = "AnomalyDetection"
  template_body = <<STACK
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