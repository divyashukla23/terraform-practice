variable "region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for EC2"
  default     = "ami-0eeb03e72075b9bcc" # Amazon Linux 2 for ap-south-1
}


variable "instance_type" {
  description = "Allowed EC2 instance type"
  type        = string
  validation {
    condition = contains (["t2.micro", "t2.small", "t3.micro"], var.instance_type)
    error_message = "Invalid instance type! Must be t2.micro, t2.small, or t3.micro."
  }
}