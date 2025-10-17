variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region for deployment"
}
variable "ami_id" {
  type        = string
  description = "AMI ID for EC2"
  default     = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type for EC2"
}
variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
}
variable "vpc_id" {
  type        = string
  description = "VPC ID for the security group"
}
variable "sg_name" {
  type    = string
  default = "Web-SG"
}
variable "instance_name" {
  type    = string
  default = "Terraform-EC2"
}