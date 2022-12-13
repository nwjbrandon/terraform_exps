data "aws_iam_policy_document" "s3_read_public_access_policy_document" {
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
  
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:DeleteBucket",
    ]

    effect = "Deny"

    resources = [
      aws_s3_bucket.images.arn,
      "${aws_s3_bucket.images.arn}/*",
    ]
  }
}