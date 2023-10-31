# PBS TF Application Insights Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-application-insights-module?ref=0.0.14
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Provisions a CloudWatch Applications Insights application.

This module is intended to be integrated with the [PBS TF Resource Group Module](https://github.com/pbs/terraform-aws-resource-group-module).

Integrate this module like so:

```hcl
module "resource_group" {
  source = "github.com/pbs/terraform-aws-resource-group-module?ref=0.0.2"

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

module "application_insights" {
  source = "github.com/pbs/terraform-aws-application-insights-module?ref=0.0.14"

  resource_group_name = module.resource_group.name

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`0.0.14`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.23.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_applicationinsights_application.app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/applicationinsights_application) | resource |
| [aws_default_tags.common_tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (sharedtools, dev, staging, qa, prod) | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Tag used to group resources according to product | `string` | n/a | yes |
| <a name="input_repo"></a> [repo](#input\_repo) | Tag used to point to the repo using this module | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_auto_config_enabled"></a> [auto\_config\_enabled](#input\_auto\_config\_enabled) | Indicates whether Application Insights automatically configures unmonitored resources in the resource group. | `bool` | `true` | no |
| <a name="input_auto_create"></a> [auto\_create](#input\_auto\_create) | Configures all of the resources in the resource group by applying the recommended configurations. | `bool` | `null` | no |
| <a name="input_cwe_monitor_enabled"></a> [cwe\_monitor\_enabled](#input\_cwe\_monitor\_enabled) | Indicates whether Application Insights can listen to CloudWatch events for the application resources, such as instance terminated, failed deployment, and others. | `bool` | `true` | no |
| <a name="input_grouping_type"></a> [grouping\_type](#input\_grouping\_type) | Application Insights can create applications based on a resource group or on an account. To create an account-based application using all of the resources in the account, set this parameter to ACCOUNT\_BASED. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the application insights module. If null, will default to product. | `string` | `null` | no |
| <a name="input_ops_center_enabled"></a> [ops\_center\_enabled](#input\_ops\_center\_enabled) | When set to true, creates opsItems for any problems detected on an application. | `bool` | `true` | no |
| <a name="input_ops_item_sns_topic_arn"></a> [ops\_item\_sns\_topic\_arn](#input\_ops\_item\_sns\_topic\_arn) | SNS topic provided to Application Insights that is associated to the created opsItem. Allows you to receive notifications for updates to the opsItem. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the application insights application. |
| <a name="output_id"></a> [id](#output\_id) | The name of the application insights application. |
