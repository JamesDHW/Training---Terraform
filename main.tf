terraform {
  cloud {
    organization = "jameshw"
    workspaces {
      name = "Training-Workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

module "server" {
  source = "./server"

  vpc_id = data.aws_vpc.target_vpc.id
}

module "database" {
  source = "./database"

  vpc_id = data.aws_vpc.target_vpc.id

  db_username = var.db_username
  db_password = var.db_password
}

# Questions:
# 1. what if one module needs to know the output of another (e.g. IP addresses for security groups)
# 2. difference between forward and redirect on aws_lb
# 3. is there a way of exporting the contents of a console to terraform code