variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "your-key-name"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  default     = "ami-0c55b159cbfafe1f0"  # Ubuntu 20.04 LTS
}
