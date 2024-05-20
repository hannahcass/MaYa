variable "name" {
  description = "(Required) The name of the Glue Job"
  type        = string
}

variable "create" {
  description = "(Required) Whether to create the Glue Job"
  type        = bool
  default     = true
}

variable "description" {
  description = "(Optional) The description of the Glue Job"
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "(Required) The ARN of the IAM role to be associated with the Glue Job"
  type        = string
  default     = ""
}

variable "create_role" {
  description = "(Optional) Create AWS IAM role associated with the job."
  type        = bool
  default     = false

}

variable "timeout" {
  description = "(Optional) The maximum number of seconds that a job run can consume resources before it is terminated"
  type        = number
  default     = 20
}

variable "max_capacity" {
  description = "(Optional) The number of AWS Glue data processing units (DPUs) that can be allocated when this job runs"
  type        = number
  default     = 2
}

variable "worker_type" {
  description = "(Optional) The type of predefined worker that is allocated when a job runs"
  type        = string
  default     = "G.1X"

  validation {
    condition     = contains(["Standard", "G.1X", "G.2X", "G.4X", "G.8X"], var.worker_type)
    error_message = "Accepts a value of Standard, G.1X, or G.2X, G.4X, G.8X."
  }
}

variable "number_of_workers" {
  description = "(Optional) The number of workers of a defined workerType that are allocated when a job runs"
  type        = number
  default     = 2
}

variable "extra_py_files" {
  description = "(Optional) Specifies the S3 path to a zip archive used in a job."
  type        = list(string)
  default     = []
}

variable "extra_py_files_source" {
  description = "(Optional) Specifies the source path to a directory that is zipped and uploaded to S3 at `extra_py_files`"
  type        = string
  default     = null
}

variable "extra_files" {
  description = "(Optional) The Amazon S3 paths to additional files, such as configuration files that AWS Glue copies to the working directory of your script before executing it."
  type        = list(string)
  default     = []
}

variable "security_configuration" {
  description = "(Optional) The name of the Security Configuration to be associated with the job."
  type        = string
  default     = null
}

variable "max_retries" {
  description = "(Required) The maximum number of times to retry this job if it fails"
  type        = number
  default     = 0
}

variable "script_location" {
  description = "(Required) Specifies the S3 path to a script that executes a job."
  type        = string
}

variable "max_concurrent_runs" {
  description = "(Optional) The maximum number of concurrent runs allowed for a job. The default is 1."
  type        = number
  default     = 1
}

variable "python_version" {
  description = "(Optional) The Python version being used to execute a Python shell job. Allowed values are 2 or 3."
  type        = string
  default     = "3.12"

  validation {
    condition     = contains(["3.7", "3.10", "3.12"], var.python_version)
    error_message = "Allowed value is 3.7, 3.10, 3.12."
  }
}

variable "glue_version" {
  description = "(Required) The version of the Glue Job"
  type        = string
  default     = "3.0"

  validation {
    condition     = contains(["3.0", "4.0"], var.python_version)
    error_message = "Allowed value is 3.0, 4.0."
  }
}

variable "enable_s3_parquet_optimized_committer" {
  description = "(Optional) Enables the EMRFS S3-optimized committer for writing Parquet data into Amazon S3."
  type        = bool
  default     = true
}

variable "enable_glue_datacatalog" {
  description = "(Optional) Enables you to use the AWS Glue Data Catalog as an Apache Spark Hive metastore."
  type        = bool
  default     = true
}

variable "enable_metrics" {
  description = "(Optional) Enables the collection of metrics for job profiling for job run."
  type        = bool
  default     = false
}

variable "enable_continuous_cloudwatch_log" {
  description = "(Optional) Enables real-time continuous logging for AWS Glue jobs."
  type        = bool
  default     = false
}

variable "enable_continuous_log_filter" {
  description = "(Optional) Specifies a standard filter or no filter when you create or edit a job enabled for continuous logging."
  type        = bool
  default     = true
}

variable "continuous_log_stream_prefix" {
  description = "(Optional) Specifies a custom CloudWatch log stream prefix for a job enabled for continuous logging."
  type        = string
  default     = null
}

variable "continuous_log_conversion_pattern" {
  description = "(Optional) Specifies a custom conversion log pattern for a job enabled for continuous logging."
  type        = string
  default     = null
}

variable "enable_spark_ui" {
  description = "(Optional) Enable Spark UI to monitor and debug AWS Glue ETL jobs."
  type        = bool
  default     = false
}

variable "spark_event_logs_path" {
  description = "(Optional) Specifies an Amazon S3 path. When using the Spark UI monitoring feature."
  type        = string
  default     = null
}

variable "additional_python_modules" {
  description = "(Optional) List of Python modules to add a new module or change the version of an existing module."
  type        = list(string)
  default     = []
}