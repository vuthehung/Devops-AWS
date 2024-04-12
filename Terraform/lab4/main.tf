provider "aws" {
  region = var.region
}

resource "aws_key_pair" "hungdev-keypair" {
  key_name   = "hungdev-keypair"
  public_key = file("./key-pair/hungdev-key.pub")
}

resource "aws_instance" "demo-instance" {
  ami           = var.amis[var.region]
  instance_type = var.instance_type
  key_name      = aws_key_pair.hungdev-keypair.key_name
  tags = {
    Name = "EC2 TF Demo"
  }
  vpc_security_group_ids = [aws_security_group.test-security-group.id]
}

resource "aws_eip" "demo-eip" {
  instance = aws_instance.demo-instance.id
}

resource "aws_security_group" "test-security-group" {
  name        = "test-security-group"
  description = "test-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_id_addr_public" {
  value = aws_eip.demo-eip.public_ip
}

output "instance_id_addr_private" {
  value = aws_instance.demo-instance.private_ip
}

output "security_group_id" {
  value = aws_security_group.test-security-group.id
}
