locals {
  tags = merge(var.input_tags, {
    "ModuleSourceRepo" = "https://github.com/StratusGrid/terraform-aws-anomaly-detection-alerts"
  })
}