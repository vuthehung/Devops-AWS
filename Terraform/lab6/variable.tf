variable "region" {
  type    = string
  default = "ap-southeast-1"
}
#parameters for networking module
variable "availability_zone_1" {
  type     = string
  nullable = false
}
variable "availability_zone_2" {
  type     = string
  nullable = false
}
variable "cidr_block" {
  type     = string
  nullable = false
}
variable "public_subnet_ips" {
  type     = list(string)
  nullable = false

}
variable "private_subnet_ips" {
  type     = list(string)
  nullable = false
}

#parameter for compute module
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch. Example: t2.micro"
  default     = "t2.micro"
}
variable "amis" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-0910e4162f162c238"
    "ap-northeast-1" : "ami-0bdd30a3e20da30a1"
  }
}
variable "keypair_path" {
  type    = string
  default = "./key-pair/hungdev-key.pub"
}
