variable "region" {
  type        = string
  description = "AWS region to deploy resources"
  validation {
    condition     = contains(["us-east-1", "us-west-2", "ap-south-1"], var.region)
    error_message = "Region must be one of us-east-1, us-west-2, or ap-south-1"
  }
}

variable "ami_id" {
  description = "AMI ID for EC2"
  default     = "ami-0eeb03e72075b9bcc" # Amazon Linux 2 for ap-south-1
}
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "percia-tf-bucket"
}
variable "instance_type"{
  type        = string
  description = "Type of EC2 instance"
  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be t2.micro, t2.small, or t2.medium"
  }
}
