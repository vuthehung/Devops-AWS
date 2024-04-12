output "instance_id_addr_private" {
  value = aws_instance.deme-instance.private_ip
}

output "instance_id_addr_public" {
  value = aws_eip.demo-eip.public_ip
}
