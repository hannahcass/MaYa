resource "aws_glue_job" "glue_job" {
  name                   = var.name
  role_arn               = var.role_arn
  description            = var.description
  glue_version           = var.glue_version
  timeout                = var.timeout
  worker_type            = var.worker_type
  number_of_workers      = var.number_of_workers
  security_configuration = var.security_configuration

  command {
    name            = "glueetl"
    script_location = var.script_location
    python_version  = var.python_version
  }

  execution_property {
    max_concurrent_runs = var.max_concurrent_runs
  }

  default_arguments = {
    "--extra-py-files"                        = length(var.extra_py_files) > 0 ? join(",", var.extra_py_files) : null
    "--extra-py-files-source"                 = var.extra_py_files_source
    "--extra-files"                           = length(var.extra_files) > 0 ? join(",", var.extra_files) : null
    "--enable-s3-parquet-optimized-committer" = var.enable_s3_parquet_optimized_committer
    "--enable-glue-datacatalog"               = var.enable_glue_datacatalog ? "" : null
    "--enable-metrics"                        = var.enable_metrics ? "" : null
    "--spark-event-logs-path"                 = var.spark_event_logs_path
    "--additional-python-modules"             = length(var.additional_python_modules) > 0 ? join(",", var.additional_python_modules) : null
  }

}