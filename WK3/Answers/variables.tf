variable "instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "iam_user_name" {
  description = "Name of the IAM user"
  type        = string
  default     = "BOB"
}
