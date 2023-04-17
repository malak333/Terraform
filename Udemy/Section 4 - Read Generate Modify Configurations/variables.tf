variable "vpn_ip" {
  default = "116.50.30.33/32"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0f3c9c466bb525749" # us-east2
}

variable "aws_security_group_name" {
  default = "terraform-security-group"
}