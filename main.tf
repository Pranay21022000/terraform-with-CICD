provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "terraform/state.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change AMI ID based on your region
  instance_type = "t2.micro"
  key_name      = "key-pair"
  
  tags = {
    Name = "Terraform-EC2"
  }
}
