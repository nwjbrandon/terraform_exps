resource "aws_lambda_function" "read_questions" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_read_questions"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}