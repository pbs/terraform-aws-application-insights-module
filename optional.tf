variable "name" {
  description = "Name of the application insights module. If null, will default to product."
  default     = null
  type        = string
}

variable "auto_config_enabled" {
  description = "Indicates whether Application Insights automatically configures unmonitored resources in the resource group."
  default     = true
  type        = bool
}

variable "auto_create" {
  description = "Configures all of the resources in the resource group by applying the recommended configurations."
  default     = null
  type        = bool
}

variable "cwe_monitor_enabled" {
  description = " Indicates whether Application Insights can listen to CloudWatch events for the application resources, such as instance terminated, failed deployment, and others."
  default     = true
  type        = bool
}

variable "grouping_type" {
  description = "Application Insights can create applications based on a resource group or on an account. To create an account-based application using all of the resources in the account, set this parameter to ACCOUNT_BASED."
  default     = null
  type        = string
}

variable "ops_center_enabled" {
  description = "When set to true, creates opsItems for any problems detected on an application."
  default     = true
  type        = bool
}

variable "ops_item_sns_topic_arn" {
  description = "SNS topic provided to Application Insights that is associated to the created opsItem. Allows you to receive notifications for updates to the opsItem."
  default     = null
  type        = string
}
