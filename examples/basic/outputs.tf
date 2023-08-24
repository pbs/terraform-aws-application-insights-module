output "id" {
  description = "The name of the application insights application."
  value       = module.application_insights.id
}

output "arn" {
  description = "The ARN of the application insights application."
  value       = module.application_insights.arn
}
