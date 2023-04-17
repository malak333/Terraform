/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/
resource "aws_instance" "my_first_ec2" {
   ami = "ami-0f3c9c466bb525749"
   instance_type = "t2.micro"
}
/* this is a comment, and it is multiple lines
adfad
*/