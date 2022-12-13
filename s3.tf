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
    policy = data.aws_iam_policy_document.s3_read_public_access_policy_document.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "images_server_side_encryption_configuration" {
    bucket = aws_s3_bucket.images.bucket

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm     = "AES256"
        }
    }
}
