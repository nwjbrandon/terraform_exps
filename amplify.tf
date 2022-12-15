# resource "aws_amplify_app" "the-best-app" {
#   name       = "${var.ORGANIZATION_NAMESPACE}-app"
#   repository = "https://github.com/ai-cet/Softmark"

#   access_token             = var.GITHUB_ACCESS_TOKEN
#   enable_branch_auto_build = true
#   build_spec               = <<-EOT
# version: 1
# applications:
#   - frontend:
#       phases:
#         build:
#           commands: 
#           - yarn install --frozen-lockfile 
#           - yarn build
#       artifacts:
#         baseDirectory: /build
#         files:
#           - '**/*'
#       cache:
#         paths: 
#           - 'node_modules/**'
#     appRoot: frontend/
#   EOT
#   # The default rewrites and redirects added by the Amplify Console.
#   custom_rule {
#     source = "/<*>"
#     status = "404"
#     target = "/index.html"
#   }
#   environment_variables = {
#     ENV = "dev"
#   }
# }

# resource "aws_amplify_branch" "develop" {
#   app_id      = aws_amplify_app.the-best-app.id
#   branch_name = "develop"
#   framework   = "React"
#   stage       = "DEVELOPMENT"
# }