resource "aws_lambda_function" "align_foolscap" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-align-foolscap"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60

  environment {
    variables = {
      taskType = "align_foolscap"
    }
  }
}

resource "aws_lambda_function" "align_page" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-align-page"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60

  environment {
    variables = {
      taskType = "align_page"
    }
  }
}


resource "aws_lambda_function" "detect_bubbles" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-detect-bubbles"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60

  environment {
    variables = {
      taskType = "detect_bubbles"
    }
  }
}

resource "aws_lambda_function" "detect_script_page_num" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-detect-script-page-num"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "detect_script_page_num"
    }
  }
}

resource "aws_lambda_function" "detect_template_page_nums" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-detect-template-page-nums"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "detect_template_page_nums"
    }
  }
}

resource "aws_lambda_function" "find_id_box" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-find-id-box"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "find_id_box"
    }
  }
}

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

resource "aws_lambda_function" "match_page" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-match-page"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "match_page"
    }
  }
}

resource "aws_lambda_function" "read_id_num" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-read-id-num"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "read_id_num"
    }
  }
}

resource "aws_lambda_function" "read_questions" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}-read-questions"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "read_questions"
    }
  }
}

resource "aws_lambda_function" "scan_bubbles" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}_scan_bubbles"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "scan_bubbles"
    }
  }
}

resource "aws_lambda_function" "sort_script" {
  function_name = "${var.ORGANIZATION_NAMESPACE}-${var.LAMBDA_CV_NAMESPACE}_sort_script"
  architectures = ["x86_64"]
  role          = aws_iam_role.lambda_iam_role.arn
  image_uri     = "${var.AWS_ACCOUNT_NUMBER}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/${var.ORGANIZATION_NAMESPACE}-cv:latest"
  package_type  = "Image"
  memory_size   = 2048
  timeout       = 60
  environment {
    variables = {
      taskType = "sort_script"
    }
  }
}
