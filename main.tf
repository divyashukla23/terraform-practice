provider "aws" {
  region = var.region
}

module "ec2_dev" {
    source = "./modules/ec2_instance"
    ami_id = var.ami_id
    instance_type = var.instance_type
    instance_name = "dev_server"
    environment = "dev"
  
}
module "s3_dev" {
  source = "./modules/s3"
  bucket_name = var.s3_bucket_name
  enable_versioning = true
  environment = "development"
}
output "dev_public_ip" {
  value = module.ec2_dev.instance_public_ip
}
output "s3_bucket_name" {
  value = module.s3_dev.bucket_name
}