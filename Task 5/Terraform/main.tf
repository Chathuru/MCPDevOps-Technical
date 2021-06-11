provider "aws" {
    region  = var.region
    version = "~> 2.0"
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

module "eks" {
    source                      = "../../modules/eks"
    eks_cluster_name            = join("-", [var.project, var.environment, var.eks_cluster_name])
    environment                 = var.environment
    eks_cluster_role            = "RrodEKSClusterRole"
    subnet_id_in_vpc            = [ module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1], module.vpc.private_subnet_ids[0], module.vpc.private_subnet_ids[1]]
    cluster_sg_name             = join("-", [var.eks_cluster_name, "SG"])
    vpc_id                      = module.vpc.vpc_id
    nodes_sg_name               = join("-", [var.eks_cluster_name,"NG-SG"])
    public_subnet_ids           = [ module.vpc.public_subnet_ids[0], module.vpc.public_subnet_ids[1]]
    private_subnet_ids          = [ module.vpc.private_subnet_ids[0], module.vpc.private_subnet_ids[1]]
    ami_type                    = "AL2_x86_64"
    disk_size                   = 10
    instance_types              = ["t3.medium"]
    asg_public_desired_size     = 2
    asg_public_max_size         = 2
    asg_public_min_size         = 2
    asg_private_desired_size    = 2
    asg_private_max_size        = 2
    asg_private_min_size        = 2
    depends_on = [
      module.vpc
    ]
}
