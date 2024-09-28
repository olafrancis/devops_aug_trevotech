# main.tf

# Specify the provider
provider "aws" {
  region = "us-west-2"  # Change to your preferred region
}

# Define the EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change to your preferred AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
