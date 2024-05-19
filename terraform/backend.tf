terraform {
  backend "s3" {
    bucket         = "recsys-maya-terraform-state"
    key            = "state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "recsys-maya-terraform-state"
    encrypt        = true
  }
}
