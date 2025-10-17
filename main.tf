provider "aws" {
  region = var.aws_region
}


data "aws_vpc" "default" {
  default = true
}

# data "aws_subnets" "default" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}
resource "aws_instance" "web" {
  count                       = 2
  ami                         = var.ami_id
  instance_type               = var.instance_type
#   subnet_id                   = element(data.aws_subnets.default.ids, count.index)
  subnet_id                    = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true


  tags = {
    Name = "Web-Server-${count.index + 1}"
    Env  = "Dev"
  }
# EOF is called "heredoc"
  user_data = <<-EOF
     #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    echo "<h1>Hello from Web Server ${count.index + 1}</h1>" > /var/www/html/index.html
    sudo systemctl start apache2
    EOF

}