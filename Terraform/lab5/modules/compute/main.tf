resource "aws_instance" "deme-instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.ec2_security_group_ids
  tags = {
    Name = "EC2 TF Demo"
  }
}

resource "aws_eip" "demo-eip" {
  instance = aws_instance.deme-instance.id
}
