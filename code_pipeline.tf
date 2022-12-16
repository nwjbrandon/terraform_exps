# Authentication with the connection provider must be completed in the AWS Console.
resource "aws_codestarconnections_connection" "example" {
  name          = var.ORGANIZATION_NAMESPACE
  provider_type = "GitHub"
}

resource "aws_codepipeline" "codepipeline" {
  name     = "${var.ORGANIZATION_NAMESPACE}-pipeline"
  role_arn = "arn:aws:iam::502358162358:role/service-role/my_code_pipeline"

  artifact_store {
    location = aws_s3_bucket.terraform-deployment.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["SourceOutput"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.example.arn
        FullRepositoryId = var.GITHUB_REPO_ID
        BranchName       = var.GITHUB_BRANCH
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceOutput"]
      output_artifacts = ["BuildOutput"]
      version          = "1"

      configuration = {
        ProjectName = aws_codebuild_project.codebuild.name
      }
    }
  }

}