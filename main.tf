terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

module "ec2" {
  source = "./modules/ec2"

  name          = "example-ec2"
  instance_type = "t3.micro"
}

moved {
  from = aws_instance.example
  to   = module.ec2.aws_instance.example
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value = module.ec2.public_ip
}
