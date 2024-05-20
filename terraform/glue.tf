locals {
  glue_function_definition = {
    recs-processor = {
      name              = "recs-processor"
      create            = true
      description       = "MaYa recs processor"
      role_arn          = "arn:aws:iam::471112978822:role/glue_role"
      script_location   = "${var.path_to_root}scripts/glue/recommender/recommender.py"
      glue_version      = "4.0"
      python_version    = "3"
      max_capacity      = 2
      worker_type       = "Standard"
      number_of_workers = 2
      max_retries       = 2
      timeout           = 20


    }
  }
}

module "glue_job" {
  source   = "../terraform/modules/glue-job"
  for_each = local.glue_function_definition

  name                   = lookup(each.value, "name", "")
  description            = lookup(each.value, "description", "")
  role_arn               = lookup(each.value, "role_arn", "")
  script_location        = lookup(each.value, "script_location", "")
  glue_version           = lookup(each.value, "glue_version", "4.0")
  timeout                = lookup(each.value, "timeout", 20)
  worker_type            = lookup(each.value, "worker_type", "Standard")
  number_of_workers      = lookup(each.value, "number_of_workers", 2)
  security_configuration = lookup(each.value, "security_configuration", "")
  python_version         = lookup(each.value, "python_version", "3")
}