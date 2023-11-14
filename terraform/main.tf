provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "itsa-terraform-states"
    key            = "infra-terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "infra-terraform-state-lock"
  }
}

import {
  to = aws_rds_cluster.main_cluster
  id = "itsa-db"
}