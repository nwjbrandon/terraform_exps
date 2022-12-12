resource "aws_ecr_repository" "cv" {
    name                 = "${var.ORGANIZATION_NAME}-cv"

    image_scanning_configuration {
        scan_on_push = true
    }
}