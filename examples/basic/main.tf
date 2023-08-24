module "resource_group" {
  source = "github.com/pbs/terraform-aws-resource-group-module?ref=0.0.2"

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

module "application_insights" {
  source = "../.."

  resource_group_name = module.resource_group.name

  # This is done to make destroying more reliable. See https://github.com/hashicorp/terraform-provider-aws/issues/27277
  auto_config_enabled = false

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}
