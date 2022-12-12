resource "aws_iam_role" "lambda_iam" {
    name = "${var.ORGANIZATION_NAME}-${var.LAMBDA_IAM_NAME}"
    assume_role_policy = file("aws_policies/lambda_policy.json")
}