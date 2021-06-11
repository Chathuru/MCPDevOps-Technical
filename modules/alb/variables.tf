variable "name" {
  type = string
}

variable "subnets" {
  type = string
}

variable "enabled_access_logs" {
  type = bool
  default = true
}

variable "bucket_name" {
  type = string
}

variable "environment" {
  type = string
}
