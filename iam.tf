# provider "aws" {
#   region = "us-east-1"
# }


# resource "aws_iam_user" "lb" {
#   name = "user1"
#   path = "/"

#   tags = {
#     Name = "user1"
#     tag-key = "tag-value"
#   }
# }

# resource "aws_iam_access_key" "lb" {
#   user = aws_iam_user.lb.name
# }

# data "aws_iam_policy_document" "lb_ro" {
#   statement {
#     effect    = "Allow"
#     actions   = ["ec2:Describe*"]
#     resources = ["*"]
#   }
# }

# resource "aws_iam_user_policy" "lb_ro" {
#   name   = "test"
#   user   = aws_iam_user.lb.name
#   policy = data.aws_iam_policy_document.lb_ro.json
# }