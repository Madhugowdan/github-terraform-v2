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
  #region     = aws-region
  # access_key = aws-access-key-id
  # secret_key = aws-secret-access-key

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