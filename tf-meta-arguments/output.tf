output "instance_ids" {
  value = aws_instance.web[*].id
}

output "bucket_names" {
  value = [for k, v in aws_s3_bucket.env_buckets : v.bucket]
}

output "security_group" {
  value = aws_security_group.web_sg.name
}
