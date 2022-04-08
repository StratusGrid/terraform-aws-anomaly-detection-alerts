<!-- BEGIN_TF_DOCS -->
# template-terraform-module-starter

GitHub: [StratusGrid/template-terraform-module-starter](https://github.com/StratusGrid/template-terraform-module-starter)

This Repo is meant to act as a template which can be used
when creating new modules.

NOTE! Don't forget to change the module source repo tag in `tags.tf`!

## Example

```hcl
module "template_terraform_module_starter" {
  source     = "StratusGrid/template-terraform-module-starter/aws"
  version    = "1.0.0"
  # source   = "github.com/StratusGrid/terraform-aws-template-terraform-module-starter"
  name       = "${var.name_prefix}-template-terraform-module-starter${local.name_suffix}"
  input_tags = merge(local.common_tags, {})
}
```

---

## Requirements

No requirements.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.example_resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | <pre>{<br>  "Developer": "StratusGrid",<br>  "Provisioner": "Terraform"<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | name to prepend to all resource names within module | `string` | n/a | yes |

## Outputs

No outputs.

---

Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml`
<!-- END_TF_DOCS -->