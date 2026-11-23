terraform {

  cloud {

    organization = "hcp_demo_practice"

    workspaces {
      name = "aws_infra"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.73.0"
    }
  }


}

provider "aws" {
  # Configuration options
  region = var.aws_region
}
