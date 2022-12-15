# # resource "aws_amplify_app" "example" {
# #   name       = "example"
# #   repository = "https://github.com/ai-cet/Softmark"

# #   access_token = "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"

# #   # The default build_spec added by the Amplify Console for React.
# # #   build_spec = <<-EOT
# # # version: 1
# # # applications:
# # #   - frontend:
# # #       phases:
# # #         build:
# # #           commands: 
# # #           - yarn install --frozen-lockfile 
# # #           - yarn build
# # #       artifacts:
# # #         baseDirectory: /build
# # #         files:
# # #           - '**/*'
# # #       cache:
# # #         paths: 
# # #           - 'node_modules/**'
# # #     appRoot: frontend/
# # #   EOT

# # #   # The default rewrites and redirects added by the Amplify Console.
# # #   custom_rule {
# # #     source = "/<*>"
# # #     status = "404"
# # #     target = "/index.html"
# # #   }

# #   environment_variables = {
# #     ENV = "test"
# #   }
# # }


# resource "aws_amplify_app" "the-best-app" {
#   name       = "${var.TEST}"
#   repository = "https://github.com/ai-cet/Softmark"

#   access_token = "${var.GITHUB_ACCESS_TOKEN}"
# #   iam_service_role_arn = aws_iam_role.amplify-codecommit.arn
#   enable_branch_auto_build = true
#   build_spec = <<-EOT
#     version: 0.1
#     frontend:
#       phases:
#         preBuild:
#           commands:
#             - npm install
#             - npm test -- --watchAll=false
#         build:
#           commands:
#             - npm run build
#       artifacts:
#         baseDirectory: build
#         files:
#           - '**/*'
#       cache:
#         paths:
#           - node_modules/**/*
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
#   framework = "React"
#   stage     = "DEVELOPMENT"
# }