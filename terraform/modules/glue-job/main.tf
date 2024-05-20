resource "aws_glue_job" "this" {
  name                   = var.name
  role_arn               = var.role_arn
  description            = var.description
  glue_version           = var.glue_version
  timeout                = var.timeout
  max_capacity           = var.max_capacity
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
    "--enable-continuous-cloudwatch-log"      = var.enable_continuous_cloudwatch_log
    "--enable-continuous-log-filter"          = var.enable_continuous_log_filter
    "--continuous-log-logGroup"               = join("", aws_cloudwatch_log_group.log_group.*.name)
    "--continuous-log-logStreamPrefix"        = var.continuous_log_stream_prefix
    "--continuous-log-conversionPattern"      = var.continuous_log_conversion_pattern
    "--enable-spark-ui"                       = var.enable_spark_ui
    "--spark-event-logs-path"                 = var.spark_event_logs_path
    "--additional-python-modules"             = length(var.additional_python_modules) > 0 ? join(",", var.additional_python_modules) : null
  }
}

