output "job_arn" {
  description = "Amazon Resource Name (ARN) of Glue Job."
  value       = aws_glue_job.glue_job.arn
}

output "job_id" {
  description = "Job name."
  value       = aws_glue_job.glue_job.id
}