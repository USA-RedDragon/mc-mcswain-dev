terraform {
  cloud {
    organization = "Personal-McSwain"

    workspaces {
      name = "mc-mcswain-dev"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.8.0"
    }
  }
}

locals {
  name     = "mc-mcswain-dev"
  vpc_cidr = "10.0.0.0/16"
}

provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.name
  cidr = local.vpc_cidr

  azs = data.aws_availability_zones.available_zones.names
  public_subnets = [
    cidrsubnet(local.vpc_cidr, 8, 0),
    cidrsubnet(local.vpc_cidr, 8, 1),
    cidrsubnet(local.vpc_cidr, 8, 2)
  ]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
