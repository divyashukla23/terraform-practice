output "instance_id" {
  description = "The ID of the insatnec being created"
  value = aws_instance.web.id
}

output "instance_public_ip" {
  description = "the public IP of my ec2"
  value = aws_instance.web.public_ip
}