variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance to launch. Example: t2.micro"
  default     = "t2.micro"
}

variable "amis" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-0910e4162f162c238",
    "ap-northeast-1" : "ami-0bdd30a3e20da30a1"
  }
}

variable "keypair_path" {
  type    = string
  default = "./key-pair/hungdev-key.pub"
}
