resource "aws_lambda_function" "align_foolscap" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_align_foolscap"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "align_foolscap_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_align_foolscap"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "align_page" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_align_page"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "align_page_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_align_page"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "detect_bubbles" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_detect_bubbles"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "detect_bubbles_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_detect_bubbles"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "detect_script_page_num" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_detect_script_page_num"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "detect_script_page_num_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_detect_script_page_num"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "detect_template_page_nums" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_detect_template_page_nums"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "detect_template_page_nums_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_detect_template_page_nums"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "find_id_box" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_find_id_box"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "find_id_box_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_find_id_box"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "healthcheck" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_healthcheck"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "healthcheck_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_healthcheck"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "match_page" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_match_page"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "match_page_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_match_page"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "read_id_num" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_read_id_num"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "read_id_num_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_read_id_num"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "read_questions" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_read_questions"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "read_questions_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_read_questions"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "scan_bubbles" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_scan_bubbles"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "scan_bubbles_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_scan_bubbles"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "sort_script" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_sort_script"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}

resource "aws_lambda_function" "sort_script_dev" {
    function_name = "${var.ORGANIZATION_NAME}_${var.LAMBDA_CV_NAME}_dev_sort_script"
    architectures = ["x86_64"]
    role          = aws_iam_role.lambda_iam.arn
    image_uri     = "${var.ECR_ROOT_NAME}/${var.ORGANIZATION_NAME}-cv:softmark_cv-latest"
    package_type  = "Image"
    memory_size   = 2048
    timeout       = 60 
}
