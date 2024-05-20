output "s3-bucket" {
  description = "map of s3_buckets and it's outputs"
  value       = { for k, v in module.s3-bucket : k => v }
}

output "eventbridge_rules_arns" {
  description = "ARNs of the EventBridge rules"
  value       = { for key, value in module.eventbridge : key => value.eventbridge_rule_arns }
}