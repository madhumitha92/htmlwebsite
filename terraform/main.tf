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

resource "aws_instance" "web_server" {
  ami           = "ami-05c969369880fa2c2"
  instance_type = "t2.micro"
  key_name = "linuxkey"
  tags = {
    Name = "WebServer"
  }
  # Define an EC2 instance resource with the specified AMI, instance type, and tags
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
  # Output the public IP address of the EC2 instance
}

