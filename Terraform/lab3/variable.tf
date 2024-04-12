variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "amis" {
  type = map(any)
  default = {
    "ap-southeast-1" : "ami-0910e4162f162c238",
    "ap-northeast-1" : "ami-0bdd30a3e20da30a1"
  }
}
variable "image_id" {
  type        = string
  description = "AMI"
}

variable "instance_type" {
  type        = string
  description = "type EC2"
  default     = "t1.micro"
}
