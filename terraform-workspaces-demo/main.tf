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
# another way of passing creds in tf sensitivly :
# aws ssm put-parameter \                                                             ─╯
#   --name "db_password" \
#   --value "MySecurePass123" \
#   --type "SecureString"

# refernce it in tf using : 
# data "aws_ssm_parameter" "db_password" {
#   name = "db_password"
#   with_decryption = true
# }

# output "password" {
#   value     = data.aws_ssm_parameter.db_password.value
#   sensitive = true
# }
