resource "aws_lambda_function" "healthcheck" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-healthcheck"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "healthcheck"
    }
  }
}
