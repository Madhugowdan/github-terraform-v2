# terraform {
#   backend "s3" {
#     bucket = "my-terraform-state-bucket"
#     key    = "path/to/my/state"
#     region = "us-west-2"
#   }
# }

# resource "aws_s3_bucket" "example" {
#   bucket = "my-terraform-state-bucket"
# }

provider "aws" {
  region     = "AWS_REGION"
  access_key = var.TF_VAR_AWS_ACCESS_KEY_ID
  secret_key = var.TF_VAR_AWS_SECRET_ACCESS_KEY

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# # Configure the AWS Provider
# provider "aws" {
#   region = "eu-central-1"
# }