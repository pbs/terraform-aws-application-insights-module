output "id" {
  description = "The name of the application insights application."
  value       = aws_applicationinsights_application.app.id
}

output "arn" {
  description = "The ARN of the application insights application."
  value       = aws_applicationinsights_application.app.arn
}
