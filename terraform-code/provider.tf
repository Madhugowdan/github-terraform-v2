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
  region     = "eu-central-1"
   access_key = "AWS_ACCESS_KEY_ID"
   secret_key = "AWS_SECRET_ACCESS_KEY"

  #  access_key = "AKIAZW65LS4PZCGZ4G5R"
  # secret_key = "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"
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