// this is a global variable which any other user could change
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

// this is a local variable which cannot be changed by another user except you
locals {
    iam_user_extension = "my_iam_user_name"
}

// creating an IAM user 
resource "aws_iam_user" "my_iam_user" {
    name = "${locals.iam_user_extension}_${var.environment}"
}