output "public_ip" {
  description = "public ip of my instance"
  value = aws_instance.my-ec2.public_ip
}