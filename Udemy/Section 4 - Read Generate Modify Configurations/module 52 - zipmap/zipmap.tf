/*provider "aws" {
  region     = "us-east-2"
  access_key = #
  secret_key = #
}
*/

#tolist(["red", "blue", "green"])
#list1 = ["red", "blue"]
#list2 = ["apple", "sky"]
#zipmap(["pineapple", "oranges", "strawberry"], ["yellow", "orange", "red"])
zipmap(["pineapple", "oranges", "strawberry"], ["yellow", 'orange", "red"])
#zipmap(list1, list2)
#mapping = zipmap(["red", "blue"], ["apple", "sky"])
#zipmap(["red", "blue"], ["apple", "sky"])

resource "aws_iam_user" "lb" {
  name = "demo-user.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}


output "zipmap" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}