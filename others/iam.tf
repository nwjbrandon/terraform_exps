# resource "aws_iam_role" "lambda_iam_role" {
#     name = "${var.ORGANIZATION_NAME}-${var.LAMBDA_IAM_ROLE_NAME}"
#     assume_role_policy = file("aws_policies/lambda_iam_role_policy.json")
# }
