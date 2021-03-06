variable "region" {
    description = "aws regios"
    default = "ap-southeast-1"
}

variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

variable "project" {
  description = "project name"
  default     = "PROJECT-01"
}

variable "eks_cluster_name" {
  description = "EKS cluster Name"
  default     = "EKS-1"
}

variable "public_subnet_cidr_blocks" {
  description = "Public Subnet CIDR list"
  default     = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "Private Subnet CIDR list"
  default     = ["10.1.100.0/24", "10.1.101.0/24"]
}

variable "ami_type" {
  description = "EKS ami type"
  default     = "AL2_x86_64"
}

variable "instance_public_key" {
  description = "instance SSH Public Key name"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIfKSOU3mGLaLiF9ki4S2XX/eLYPmxwFwmpKU17ZqPK9l/7LDT1//KSrhKZkbUIX9hmjaHz6ELxOktta9XRTdeij9+C9R2ESkV62vD0hnnoFATWhZaGkccYJoxNrjEY1GxBBkq2zNXeP91FS0n8tGGmEXUFOap8ZZe1RKo94eWoTah/xXMF9Prf+juIQxsmtMa2q7ZEMkMsEobgCUeyDEybRmIN9ehwfgTnjDjIkkk85VSgn5gNxUiMcZdNrC1jD6sOFZLgC+RT+qwgGYDoy6MUKwYKl6z06rkBvo3lm99OEmuaKx+JntzsSVbdl+sc8Qb1xg8WMdAgXtpMpyUwLmv"
}
