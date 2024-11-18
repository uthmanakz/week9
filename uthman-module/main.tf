terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0b2ed2e3df8cf9080"
  instance_type = "t2.micro"

  tags = {
    Name = "jenkins_terraform"
  }
}

terraform{
    backend "s3" {
    bucket         = "uthman-terraform-bucket" 
    key            = "dev/terraform.tfstate"  
    region         = "eu-west-2"              
  }
}