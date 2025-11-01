output "bucket_id" {
  value       = aws_s3_bucket.this.id
  description = "ID of the S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.this.arn
  description = "ARN of the S3 bucket"
}

output "bucket_name" {
  value       = aws_s3_bucket.this.bucket
  description = "Globally unique bucket name"
}