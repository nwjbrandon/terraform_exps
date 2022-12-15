resource "aws_iam_role" "eb_iam_service_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}_eb_iam_service_role"
  assume_role_policy = file("aws_policies/eb_iam_service_role_policy.json")
}

resource "aws_iam_instance_profile" "eb_iam_service_profile" {
  name = "${var.ORGANIZATION_NAMESPACE}_eb_iam_service_profile"
  role = aws_iam_role.eb_iam_service_role.name
}

resource "aws_iam_policy_attachment" "eb_managed_updates_customer_role_policy" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_managed_updates_customer_role_policy"
  roles      = ["${aws_iam_role.eb_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
}

resource "aws_iam_policy_attachment" "eb_enhanced_health" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_enhanced_health"
  roles      = ["${aws_iam_role.eb_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_role" "eb_iam_ec2_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}_eb_iam_ec2_role"
  assume_role_policy = file("aws_policies/eb_iam_ec2_role_policy.json")
}

resource "aws_iam_instance_profile" "eb_iam_ec2_profile" {
  name = "${var.ORGANIZATION_NAMESPACE}_eb_iam_ec2_profile"
  role = aws_iam_role.eb_iam_ec2_role.name
}

resource "aws_iam_policy_attachment" "eb_ec2_container_registry_full_access" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_ec2_container_registry_full_access"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_policy_attachment" "eb_ecr_public_read_only" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_ecr_public_read_only"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicReadOnly"
}

resource "aws_iam_policy_attachment" "eb_web_tier" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_web_tier"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_policy_attachment" "eb_multicontainer_docker" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_multicontainer_docker"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_policy_attachment" "eb_ecr_worker_tier" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_ecr_worker_tier"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

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
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${aws_subnet.public-subnet-1.id},${aws_subnet.public-subnet-2.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${aws_subnet.public-subnet-1.id},${aws_subnet.public-subnet-2.id}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SSHSourceRestriction"
    value     = "tcp, 22, 22, ${aws_vpc.vpc.cidr_block}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.KEYPAIR_NAME
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = aws_iam_role.eb_iam_service_role.name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.eb_iam_ec2_profile.name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = "/health"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "APP_URL"
    value     = var.APP_URL
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_ACCESS_KEY_ID"
    value     = var.AWS_ACCESS_KEY_ID
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_LOG_GROUP_NAME"
    value     = var.AWS_LOG_GROUP_NAME
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_LOG_STREAM_NAME"
    value     = var.AWS_LOG_STREAM_NAME
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_REGION"
    value     = var.AWS_REGION
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_EXPORTED_PDF_BUCKET"
    value     = var.AWS_S3_EXPORTED_PDF_BUCKET
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_IMAGE_BUCKET"
    value     = var.AWS_S3_IMAGE_BUCKET
  }


  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_PDF_BUCKET"
    value     = var.AWS_S3_PDF_BUCKET
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_S3_PDF_UPLOAD_BUCKET"
    value     = var.AWS_S3_PDF_UPLOAD_BUCKET
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_SECRET_ACCESS_KEY"
    value     = var.AWS_SECRET_ACCESS_KEY
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DEVELOPER_GROUP_EMAIL"
    value     = var.DEVELOPER_GROUP_EMAIL
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "JWT_SECRET"
    value     = var.JWT_SECRET
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "LISTEN"
    value     = var.LISTEN
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "RECAPTCHA_SECRET"
    value     = var.RECAPTCHA_SECRET
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "REDIS_URL"
    value     = var.REDIS_URL
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN"
    value     = var.ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "dbname"
    value     = var.dbname
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "host"
    value     = var.host
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "password"
    value     = var.password
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "port"
    value     = var.port
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "user"
    value     = var.user
  }
}

