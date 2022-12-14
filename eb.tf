resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = "${var.ORGANIZATION_NAMESPACE}-app"
  description = "${var.ORGANIZATION_NAMESPACE}-app"
}

resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = "${var.ORGANIZATION_NAMESPACE}-env-1"
  application         = aws_elastic_beanstalk_application.eb_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.2 running Docker"
  tier                = "WebServer"

  wait_for_ready_timeout = "20m"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = aws_vpc.vpc.id
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${aws_subnet.public-subnet-1.id},${aws_subnet.public-subnet-2.id}"
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${aws_subnet.public-subnet-1.id},${aws_subnet.public-subnet-2.id}"
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SSHSourceRestriction"
    value     = "tcp,22,22,${aws_vpc.vpc.cidr_block}"
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.KEYPAIR_NAME
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = aws_iam_role.eb_iam_service_role.name
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.eb_iam_ec2_profile.name
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = "/health"
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_URL"
    value     = var.APP_URL
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_ACCESS_KEY_ID"
    value     = var.AWS_ACCESS_KEY_ID
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_LOG_GROUP_NAME"
    value     = var.AWS_LOG_GROUP_NAME
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_LOG_STREAM_NAME"
    value     = var.AWS_LOG_STREAM_NAME
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_REGION"
    value     = var.AWS_REGION
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_EXPORTED_PDF_BUCKET"
    value     = var.AWS_S3_EXPORTED_PDF_BUCKET
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_IMAGE_BUCKET"
    value     = var.AWS_S3_IMAGE_BUCKET
    resource  = ""
  }


  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_PDF_BUCKET"
    value     = var.AWS_S3_PDF_BUCKET
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_PDF_UPLOAD_BUCKET"
    value     = var.AWS_S3_PDF_UPLOAD_BUCKET
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_SECRET_ACCESS_KEY"
    value     = var.AWS_SECRET_ACCESS_KEY
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DEVELOPER_GROUP_EMAIL"
    value     = var.DEVELOPER_GROUP_EMAIL
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "JWT_SECRET"
    value     = var.JWT_SECRET
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "LISTEN"
    value     = var.LISTEN
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "RECAPTCHA_SECRET"
    value     = var.RECAPTCHA_SECRET
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_URL"
    value     = var.REDIS_URL
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN"
    value     = var.ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "dbname"
    value     = var.dbname
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "host"
    value     = var.host
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "password"
    value     = var.password
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "port"
    value     = var.port
    resource  = ""
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "user"
    value     = var.user
    resource  = ""
  }
}

