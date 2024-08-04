terraform {


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
  required_version = "~> 1.0"

  backend "remote" {
    organization = "ACG-Terraform-Demos-Artyom"

    workspaces {
      name = "demo-github-actions"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}