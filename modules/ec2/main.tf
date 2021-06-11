resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow SSH"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_network_interface" "network_interface" {
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.allow_ssh.id]
  depends_on = [
    aws_security_group.allow_ssh
  ]
}

resource "aws_key_pair" "key_pair" {
  public_key = var.instance_public_key
}

resource "aws_instance" "ec2" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.key_pair.id
  subnet_id     = var.subnet_id
  user_data     = var.user_data

  network_interface {
    network_interface_id = aws_network_interface.network_interface.id
    device_index         = 0
  }

  tags = {
    name        = var.instance_name
    environment = var.environment
  }

  depends_on = [
    aws_key_pair.key_pair,
    aws_security_group.allow_ssh,
    aws_network_interface.network_interface
  ]
}
