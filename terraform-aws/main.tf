terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  tags = {
    "Name" = "created-by-tf-ubuntu"
  }
}


resource "aws_s3_bucket" "tf-s3" {
  bucket = "martah-test-bucket-ubuntu"
  acl    = "private"
}

resource "aws_s3_bucket" "tf-s4" {
  bucket = "martah-test-bucket-newubuntu"
  acl    = "private"
}

output "tf-example-public-ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf-example-s3-meta" {
  value = aws_s3_bucket.tf-s3.region
}


output "tf-example-public-dns" {
  value = aws_instance.tf-ec2.public_dns
}