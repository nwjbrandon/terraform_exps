resource "aws_s3_bucket" "b" {
    bucket = "${var.ORGANIZATION_NAME}-images"
}

resource "aws_s3_bucket_acl" "example" {
    bucket = aws_s3_bucket.b.id
    acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "example" {
    bucket = aws_s3_bucket.b.id

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET", "HEAD"]
        allowed_origins = ["*"]
        expose_headers  = []
        max_age_seconds = 3000
    }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.b.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.b.arn,
      "${aws_s3_bucket.b.arn}/*",
    ]
  }
}