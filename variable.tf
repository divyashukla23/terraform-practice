variable "region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
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