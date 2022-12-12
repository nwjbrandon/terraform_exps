resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
#   filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.lambda_iam.arn
  image_uri     = "502358162358.dkr.ecr.ap-southeast-1.amazonaws.com/nwjbrandon-production-cv:softmark_cv-v0.2.4"
  package_type  = "Image"
#   handler       = "index.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
#   source_code_hash = filebase64sha256("lambda_function_payload.zip")

#   runtime = "python3.8"

#   environment {
#     variables = {
#       foo = "bar"
#     }
#   }
}