terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "devopslearnhub-remote-state"
    key    = "VPC-Test"
    region = "us-east-1"
    dynamodb_table = "devopslearnhub"
  }
}


provider "aws" {
  region = "us-east-1"
}