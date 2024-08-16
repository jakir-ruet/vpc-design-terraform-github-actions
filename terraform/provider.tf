terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

# s3 bucket for backend state
terraform {
  backend "s3" {
    bucket = "bkt-tf-backend-state-mgt"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.aws_region
}
