# locals {
#   glue_function_definition = {}
#   recs-processor = {
#     name            = "recs-processor"
#     environment     = "default"
#     role_arn        = "arn:aws:iam::471112978822:role/glue_role"
#     script_location = "${var.path_to_root}scripts/glue/recommender/recommender.py"
#     glue_version    = "4.0"
#     python_version  = "3.12"

#     worker_type       = "Standard"
#     number_of_workers = 2
#     max_retries       = 2
#     timeout           = 20


#   }
# }

# module "glue_job" {
#   source   = "vitalibo/glue-job/aws"
#   for_each = local.glue_function_definition

#   name                         = lookup(each.value, "name", "")
#   environment                  = lookup(each.value, "environment", "default")
#   script_location              = lookup(each.value, "script_location", "")
#   glue_version                 = lookup(each.value, "glue_version", "3.0")
#   python_version               = lookup(each.value, "python_version", "3.12")
#   role_arn                     = lookup(each.value, "role_arn", "")
#   timeout                      = lookup(each.value, "timeout", 20)
#   max_retries                  = lookup(each.value, "max_retries", 2)
#   worker_type                  = lookup(each.value, "worker_type", "Standard")
#   number_of_workers            = lookup(each.value, "number_of_workers", 2)
#   extra_py_files               = lookup(each.value, "extra_py_files", [])
#   extra_files                  = lookup(each.value, "extra_files", [])
#   additional_python_modules    = lookup(each.value, "additional_python_modules", [])
#   enable_glue_datacatalog      = lookup(each.value, "enable_glue_datacatalog", false)
#   enable_metrics               = lookup(each.value, "enable_metrics", false)
#   enable_continuous_log_filter = lookup(each.value, "enable_continuous_log_filter", false)
# }