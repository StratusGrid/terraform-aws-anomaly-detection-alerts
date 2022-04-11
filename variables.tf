variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default = {
    Developer   = "StratusGrid"
    Provisioner = "Terraform"
  }
}

variable "cost_threshold" {
  description = "Defines the amount in the account currency before AWS sends an email to the subscriber(s) that an anomaly was detected."
  type        = number
}

variable "subscription_email" {
  description = "This is the email address that gets notified when an anomaly is detected."
  type        = string
}

variable "name" {
  description = "The name of the CloudFormation stack."
  type        = string
}