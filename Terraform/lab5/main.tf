provider "aws" {
  region = var.region
}

resource "aws_key_pair" "hungdev-keypair" {
  key_name   = "hungdev-keypair"
  public_key = file(var.keypair_path)
}

module "security" {
  source = "./modules/security"
  region = var.region
}

module "compute" {
  source                 = "./modules/compute"
  region                 = var.region
  image_id               = var.amis[var.region]
  instance_type          = var.instance_type
  key_name               = aws_key_pair.hungdev-keypair.key_name
  ec2_security_group_ids = [module.security.public_security_group_id]
}
