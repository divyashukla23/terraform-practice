data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Environment = var.environment
    Owner       = var.owner
  }
}


resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}