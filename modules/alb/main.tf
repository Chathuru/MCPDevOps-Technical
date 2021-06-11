resource "aws_lb" "test" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnets

  enable_deletion_protection = true

  access_logs {
    bucket  = var.bucket_name
    prefix  = "lb-"
    enabled = var.enabled_access_logs
  }

  tags = {
    environment = var.environment
  }
}
