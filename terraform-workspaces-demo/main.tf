provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "tf-${terraform.workspace}-workspace-demo-bucket"

  tags = {
    Environment = terraform.workspace
    CreatedBy   = "Terraform"
  }
}

output "bucket_name" {
  description = "S3 bucket name created for this workspace"
  value       = aws_s3_bucket.demo.bucket
}
