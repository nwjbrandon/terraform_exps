resource "aws_ecr_repository" "cv" {
  name = "${var.ORGANIZATION_NAMESPACE}-cv"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "backend" {
  name = "${var.ORGANIZATION_NAMESPACE}-backend"

  image_scanning_configuration {
    scan_on_push = true
  }
}