provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "main-vpc"
  }
}

# Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-gateway"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# Route Table Association
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group
resource "aws_security_group" "allow_http" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_sg"
  }
}

# Backend Servers
resource "aws_instance" "backend" {
  count         = 4
  ami           = "ami-0e86e20dae9224db8" # Example AMI ID
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
 # security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "backend-server-${count.index + 1}"
  }
}

# Frontend Servers
resource "aws_instance" "frontend" {
  count         = 2
  ami           = "ami-0e86e20dae9224db8" # Example AMI ID
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
 # security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "frontend-server-${count.index + 1}"
  }
}

# S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name
  #acl    = "private"
  #region = var.region

  tags = {
    Name = "my-s3-bucket"
  }
}

# IAM User
resource "aws_iam_user" "Bob" {
  name        = var.iam_user_name
  #description = "CTO"

  tags = {
    Name = "BOB"
  }
}
