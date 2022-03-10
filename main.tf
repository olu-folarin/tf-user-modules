variable "environment" {
    default = "default"
}


terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}


provider "aws" {
    region = "us-east-1"
}


// creating an IAM user 
resource "aws_iam_user" "my_iam_user" {
    name = "my_iam_user_${var.environment}"
}