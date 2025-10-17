provider "aws" {
  region = "ap-south-1"
}

data "aws_subnet" "default" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "web_sg" {

    name = "web-sg"
    description = "Allow HTTP traffic"
    vpc_id = data.aws_vpc.default.id

    ingress {
        description = "Allow HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Web-SG"
    }
}

resource "aws_instance" "demo-server" {
    ami = "ami-0f70b01eb0d5c5caa" 
    # HAVE YOUR OWN AMI
    instance_type = "t3.micro"
}

