################################
# Bucket: terraform-deployment #
################################
resource "aws_s3_bucket" "terraform-deployment" {
  bucket = "${var.ORGANIZATION_NAMESPACE}-terraform-deployment"
}

resource "aws_s3_bucket_acl" "terraform-deployment_acl" {
  bucket = aws_s3_bucket.terraform-deployment.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "terraform-deployment_cors_configuration" {
  bucket = aws_s3_bucket.terraform-deployment.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "terraform-deployment_get_objects_policy" {
  bucket = aws_s3_bucket.terraform-deployment.id
  policy = data.aws_iam_policy_document.terraform-deployment_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform-deployment_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.terraform-deployment.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "terraform-deployment_policy_document" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      aws_s3_bucket.terraform-deployment.arn,
      "${aws_s3_bucket.terraform-deployment.arn}/*",
    ]
  }

  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.terraform-deployment.arn,
      "${aws_s3_bucket.terraform-deployment.arn}/*",
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
      aws_s3_bucket.terraform-deployment.arn,
      "${aws_s3_bucket.terraform-deployment.arn}/*",
    ]
  }
}
