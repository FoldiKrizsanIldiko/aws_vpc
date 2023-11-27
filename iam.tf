#Using terraform, create an IAM user, name it admin, and attach the AdministratorAccess policy to it.

resource "aws_iam_user" "this" {
  name = "admin"
}

data "aws_iam_policy" "this" {
  name = "AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this.name
  policy_arn = data.aws_iam_policy.this.arn
}