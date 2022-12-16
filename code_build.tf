resource "aws_codebuild_project" "codebuild" {
  name           = "${var.ORGANIZATION_NAMESPACE}-codebuild"
  build_timeout  = "60"
  service_role   = "arn:aws:iam::502358162358:role/service-role/codebuild-nwjbrandon-build-service-role"
  source_version = var.GITHUB_BRANCH

  source {
    type            = "GITHUB"
    location        = var.GITHUB_URL
    git_clone_depth = 1
    buildspec      = "backend/buildspec.yml"
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:6.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.AWS_REGION
    }

    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.AWS_ACCOUNT_NUMBER
    }

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = aws_ecr_repository.backend.name
    }

    environment_variable {
      name  = "S3_BUCKET"
      value = aws_s3_bucket.terraform-deployment.bucket
    }

    environment_variable {
      name  = "ELASTIC_BEANSTALK_APP"
      value = aws_elastic_beanstalk_application.eb_app.name
    }

    environment_variable {
      name  = "ELASTIC_BEANSTALK_ENV"
      value = aws_elastic_beanstalk_environment.eb_env.name
    }

  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"

    }
  }



}