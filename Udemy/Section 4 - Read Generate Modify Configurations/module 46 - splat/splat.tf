/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/

resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}