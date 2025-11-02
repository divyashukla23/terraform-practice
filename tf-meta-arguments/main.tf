provider "aws" {
  region = "ap-south-1" # Mumbai
}

provider "aws" {
  alias  = "us"
  region = "us-east-1" # N. Virginia
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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
    Name = "web-sg"
  }
}


resource "aws_instance" "web" {
  count         = 2
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  depends_on = [aws_security_group.web_sg]

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "web-${count.index}"
    Environment = "demo"
  }
}

resource "aws_s3_bucket" "env_buckets" {
  provider = aws.us
  for_each = toset(["dev", "stage", "prod"])

  bucket = "tf-meta-${each.key}-bucket-demo"

  tags = {
    Environment = each.key
  }
}