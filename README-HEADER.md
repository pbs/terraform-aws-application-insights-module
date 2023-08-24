# PBS TF Application Insights Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-application-insights-module?ref=x.y.z
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
  source = "github.com/pbs/terraform-aws-application-insights-module?ref=x.y.z"

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

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
