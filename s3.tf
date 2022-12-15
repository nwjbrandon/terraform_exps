#########################
#                       #
# Bucket: exported-pdfs #
#                       #
#########################
resource "aws_s3_bucket" "exported-pdfs" {
  bucket = "${var.ORGANIZATION_NAMESPACE}-exported-pdfs"
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
      sse_algorithm = "AES256"
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

##################
#                #
# Bucket: images #
#                #
##################
resource "aws_s3_bucket" "images" {
  bucket = "${var.ORGANIZATION_NAMESPACE}-images"
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
      sse_algorithm = "AES256"
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

######################
#                    #
# Bucket: images-dev #
#                    #
######################
resource "aws_s3_bucket" "images-dev" {
  bucket = "${var.ORGANIZATION_NAMESPACE}-images-dev"
}

resource "aws_s3_bucket_acl" "images-dev_acl" {
  bucket = aws_s3_bucket.images-dev.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "images-dev_cors_configuration" {
  bucket = aws_s3_bucket.images-dev.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "images-dev_get_objects_policy" {
  bucket = aws_s3_bucket.images-dev.id
  policy = data.aws_iam_policy_document.images-dev_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "images-dev_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.images-dev.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "images-dev_policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.images-dev.arn,
      "${aws_s3_bucket.images-dev.arn}/*",
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
      aws_s3_bucket.images-dev.arn,
      "${aws_s3_bucket.images-dev.arn}/*",
    ]
  }
}

###############
#             #
# Bucket: pdf #
#             #
###############
resource "aws_s3_bucket" "pdf" {
  bucket = "${var.ORGANIZATION_NAMESPACE}-pdf"
}

resource "aws_s3_bucket_acl" "pdf_acl" {
  bucket = aws_s3_bucket.pdf.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "pdf_cors_configuration" {
  bucket = aws_s3_bucket.pdf.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "pdf_get_objects_policy" {
  bucket = aws_s3_bucket.pdf.id
  policy = data.aws_iam_policy_document.pdf_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pdf_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.pdf.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "pdf_policy_document" {
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
      aws_s3_bucket.pdf.arn,
      "${aws_s3_bucket.pdf.arn}/*",
    ]
  }
}

###################
#                 #
# Bucket: pdf-dev #
#                 #
###################
resource "aws_s3_bucket" "pdf-dev" {
  bucket = "${var.ORGANIZATION_NAMESPACE}-pdf-dev"
}

resource "aws_s3_bucket_acl" "pdf-dev_acl" {
  bucket = aws_s3_bucket.pdf-dev.id
  acl    = "private"
}

resource "aws_s3_bucket_cors_configuration" "pdf-dev_cors_configuration" {
  bucket = aws_s3_bucket.pdf-dev.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "pdf-dev_get_objects_policy" {
  bucket = aws_s3_bucket.pdf-dev.id
  policy = data.aws_iam_policy_document.pdf-dev_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "pdf-dev_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.pdf-dev.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "pdf-dev_policy_document" {
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
      aws_s3_bucket.pdf-dev.arn,
      "${aws_s3_bucket.pdf-dev.arn}/*",
    ]
  }
}
