terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-west-1"
  # Define AWS provider with the desired region
}

resource "aws_security_group" "sec_group" {
  name   = "sec_group"
  vpc_id = "vpc-3324nnrvdl"
}

data "aws_security_group" "testsg" {
  id = "sg-0903498cfe6b000fb"
}

resource "aws_instance" "web_server" {
  ami           = "ami-05c969369880fa2c2"
  instance_type = "t2.micro"
  key_name = "linuxkey"
  vpc_security_group_ids = [data.aws_security_group.testsg.id]
  tags = {
    Name = "WebServer"
  }
  # Define an EC2 instance resource with the specified AMI, instance type, and tags
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
  # Output the public IP address of the EC2 instance
}

