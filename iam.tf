resource "aws_iam_role" "lambda_iam_role" {
    name = "${var.ORGANIZATION_NAME}-${var.LAMBDA_IAM_ROLE_NAME}"
    assume_role_policy = file("aws_policies/lambda_iam_role_policy.json")
}

data "aws_iam_policy_document" "s3_get_objects_policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.images.arn,
      "${aws_s3_bucket.images.arn}/*",
    ]
  }
}