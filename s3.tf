resource "aws_s3_bucket" "images" {
    bucket = "${var.ORGANIZATION_NAME}-images"
}

resource "aws_s3_bucket_acl" "images_acl" {
    bucket = aws_s3_bucket.images.id
    acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "images_cors_configuration" {
    bucket = aws_s3_bucket.images.id

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET", "HEAD"]
        allowed_origins = ["*"]
        expose_headers  = []
        max_age_seconds = 3000
    }
}

resource "aws_s3_bucket_policy" "images_get_objects_policy" {
    bucket = aws_s3_bucket.images.id
    policy = data.aws_iam_policy_document.images_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "images_server_side_encryption_configuration" {
    bucket = aws_s3_bucket.images.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
}

data "aws_iam_policy_document" "images_policy_document" {
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

resource "aws_s3_bucket" "exported-pdfs" {
    bucket = "${var.ORGANIZATION_NAME}-exported-pdfs"
}

resource "aws_s3_bucket_acl" "exported-pdfs_acl" {
    bucket = aws_s3_bucket.exported-pdfs.id
    acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "exported-pdfs_cors_configuration" {
    bucket = aws_s3_bucket.exported-pdfs.id

    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET", "HEAD", "PUT"]
        allowed_origins = ["*"]
        expose_headers  = []
        max_age_seconds = 3000
    }
}

resource "aws_s3_bucket_policy" "exported-pdfs_get_objects_policy" {
    bucket = aws_s3_bucket.exported-pdfs.id
    policy = data.aws_iam_policy_document.exported-pdfs_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "exported-pdfs_server_side_encryption_configuration" {
    bucket = aws_s3_bucket.exported-pdfs.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
}

data "aws_iam_policy_document" "exported-pdfs_policy_document" {
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
      aws_s3_bucket.exported-pdfs.arn,
      "${aws_s3_bucket.exported-pdfs.arn}/*",
    ]
  }
}