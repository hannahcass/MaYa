output "job_arn" {
  description = "Amazon Resource Name (ARN) of Glue Job."
  value       = aws_glue_job.this.arn
}

output "job_id" {
  description = "Job name."
  value       = aws_glue_job.this.id
}

output "job_role_arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = length(var.role_arn) > 0 ? var.role_arn : join("", aws_iam_role.role.*.arn)
}