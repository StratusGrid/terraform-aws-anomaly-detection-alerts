<!-- BEGIN_TF_DOCS -->
<p align="center">                                                                                                                                            
                                                                                
  <img src="https://github.com/StratusGrid/terraform-readme-template/blob/main/header/stratusgrid-logo-smaller.jpg?raw=true" />
  <p align="center">                                                           
    <a href="https://stratusgrid.com/book-a-consultation">Contact Us</a> |                  
    <a href="https://stratusgrid.com/cloud-cost-optimization-dashboard">Stratusphere FinOps</a> |
    <a href="https://stratusgrid.com">StratusGrid Home</a> |
    <a href="https://stratusgrid.com/blog">Blog</a>
  </p>                    
</p>

 # terraform-aws-anomaly-detection-alerts

 GitHub: [StratusGrid/terraform-aws-anomaly-detection-alerts](https://github.com/StratusGrid/terraform-aws-anomaly-detection-alerts)

 This terraform module uses AWS Cloudformation under the hood to create AWS Cost Anomaly Detection monitors and subscriptions. 

 ## Repo Knowledge

 This repo has several base requirements
 * The following packages are installed via brew: `tflint`, `terrascan`, `terraform-docs`, `gitleaks`, `tfsec`, `pre-commit`, `tfsec`
 * Install `bash` through Brew for Bash 5.0, otherwise it will fail with the error that looks like `declare: -g: invalid option`
 * If you need more tflint plugins, please edit the `.tflint.hcl` file with the instructions from [here](https://github.com/terraform-linters/tflint)
 * It's highly recommend that you follow the Git Pre-Commit Instructions below, these will run in GitHub though they should be ran locally to reduce issues
 * By default Terraform docs will always run so our auto generated docs are always up to date
 * This repo has been tested with [awsume](https://stratusgrid.atlassian.net/wiki/spaces/TK/pages/1564966913/Awsume)
 
 ### TFSec
 
 See the pre-commit tfsec documentation [here](https://github.com/antonbabenko/pre-commit-terraform#terraform_tfsec), this includes on how to bypass warnings

 ## How to set this up in your Dev environment
 
 ### Before this is applied, you need to configure the git hook on your local machine
 
 ```bash
 #Verify you have bash5
 brew install bash
 
 # Test your pre-commit hooks - This will force them to run on all files
 pre-commit run --all-files
 
 # Add your pre-commit hooks forever
 pre-commit install
 ```

 ## Example

 ```hcl
 module "aws_anomaly_detection_alerts" {
  source     = "StratusGrid/anomaly-detection-alerts/aws"
  version    = "3.0.0"

  input_tags = merge(local.common_tags, {})

  cost_threshold     = 100                   # This is a sample of 100
  subscription_email = "mygroup@example.com" # This is the email to send the billing alert to
}
 ```

 ---

 ## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

 ## Resources

| Name | Type |
|------|------|
| [aws_ce_anomaly_monitor.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_anomaly_monitor) | resource |
| [aws_ce_anomaly_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_anomaly_subscription) | resource |

 ## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cost_threshold"></a> [cost\_threshold](#input\_cost\_threshold) | Defines the amount in the account currency before AWS sends an email to the subscriber(s) that an anomaly was detected. | `number` | n/a | yes |
| <a name="input_enable_cost_anomaly_detection"></a> [enable\_cost\_anomaly\_detection](#input\_enable\_cost\_anomaly\_detection) | Boolean to enable or disable Cost Explorer Anomaly Detection monitor and subscription. | `bool` | `true` | no |
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | <pre>{<br/>  "Developer": "StratusGrid",<br/>  "Provisioner": "Terraform"<br/>}</pre> | no |
| <a name="input_subscription_email"></a> [subscription\_email](#input\_subscription\_email) | This is the email address that gets notified when an anomaly is detected. | `string` | n/a | yes |

 ## Outputs

No outputs.

 ---

 Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml`
<!-- END_TF_DOCS -->