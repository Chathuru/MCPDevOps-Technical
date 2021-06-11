provider "aws" {
    region  = var.region
    version = "~> 2.0"
    profile = var.profile
}

module "vpc" {
    source                      = "../../modules/vpc"
    environment                 = var.environment
    vpc_cidr                    = "10.1.0.0/16"
    eks_cluster_name            = join("-", [var.project, var.environment, var.eks_cluster_name])
    project                     = var.project
    public_subnet_cidr_blocks   = var.public_subnet_cidr_blocks
    private_subnet_cidr_blocks  = var.private_subnet_cidr_blocks
}

module "nginx"{
   source                      = "../modules/ec2"
   vpc_id                      = module.vpc.vpc_id
   instance_name               = "nginx_server"
   instance_public_key         = var.instance_public_key
   environment                 = var.environment
   instance_ami                = "ami-093da183b859d5a4b"
   instance_type               = "t2.micro"
   subnet_id                   = module.vpc.public_subnet_ids[0]
   user_data                   = file("./scripts/install_nginx.sh")
   depends_on = [
     module.vpc
   ]
}

module "elk"{
   source                      = "../modules/ec2"
   vpc_id                      = module.vpc.vpc_id
   instance_name               = "elk_server"
   instance_public_key         = var.instance_public_key
   environment                 = var.environment
   instance_ami                = "ami-093da183b859d5a4b"
   instance_type               = "t2.micro"
   subnet_id                   = module.vpc.public_subnet_ids[0]
   user_data                   = file("./scripts/install_elk.sh")
   depends_on = [
     module.vpc
   ]
}

module "s3" {
  source = "../modules/s3"
  bucket_name = "ALB Logs"
  environment = var.environment
}

module "alb" {
  source = "../modules/alb"
  name = "loadbalancer"
  subnets = module.vpc.public_subnet_ids
  enabled_access_logs = true
  bucket_name = var.bucket_name
  environment = var.environment
  depends_on = [
    module.s3
  ]
}
