provider "aws" {
  region = var.region
}

module "ec2_dev" {
    source = "./modules/ec2_instance"
    ami_id = var.ami_id
    instance_type = "t2.micro"
    instance_name = "dev_server"
    environment = "dev"
  
}

output "dev_public_ip" {
  value = module.ec2_dev.instance_public_ip
}