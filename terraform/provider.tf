terraform {
  required_version = "~> 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "harukin721-aws-tfstate"
    key     = "s3-terraform-tfstate"
    region  = "ap-northeast-1"
    profile = "terraform"
  }
}
