resource "aws_amplify_app" "frontend" {
  name       = "${var.ORGANIZATION_NAMESPACE}-app"
  repository = "https://github.com/ai-cet/Softmark"

  access_token             = var.GITHUB_ACCESS_TOKEN
  enable_branch_auto_build = true
  build_spec               = <<-EOT
version: 1
applications:
  - frontend:
      phases:
        build:
          commands: 
          - yarn install --frozen-lockfile 
          - yarn build
      artifacts:
        baseDirectory: /build
        files:
          - '**/*'
      cache:
        paths: 
          - 'node_modules/**'
    appRoot: frontend/
  EOT
  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }
  environment_variables = {
    AMPLIFY_DIFF_DEPLOY                    = var.AMPLIFY_DIFF_DEPLOY
    REACT_APP_BASE_URL                     = var.REACT_APP_BASE_URL_DEV
    REACT_APP_DD_APP_ID                    = var.REACT_APP_DD_APP_ID
    REACT_APP_DD_CLIENT_TOKEN              = var.REACT_APP_DD_CLIENT_TOKEN
    REACT_APP_DD_ENV                       = var.REACT_APP_DD_ENV
    REACT_APP_RECAPTCHA_SITE_KEY           = var.REACT_APP_RECAPTCHA_SITE_KEY
    REACT_APP_ROLLBAR_POST_CLIENT_ITEM_KEY = var.REACT_APP_ROLLBAR_POST_CLIENT_ITEM_KEY

  }
}

resource "aws_amplify_branch" "staging" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = "staging"
  framework   = "React"
  stage       = "DEVELOPMENT"
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = "main"
  framework   = "React"
  stage       = "PRODUCTION"
  environment_variables = {
    REACT_APP_BASE_URL                     = var.REACT_APP_BASE_URL
  }
}