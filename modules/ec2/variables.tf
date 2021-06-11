variable "instance_name" {
  type = string
}

variable "instance_public_key" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "user_data" {
  type = string
  default = ""
}
