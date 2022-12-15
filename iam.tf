resource "aws_iam_role" "lambda_iam_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}-${var.IAM_ROLE_NAMESPACE}-lambda"
  assume_role_policy = file("aws_policies/lambda_iam_role_policy.json")
}

