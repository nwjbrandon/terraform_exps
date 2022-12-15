resource "aws_iam_instance_profile" "beanstalk_service" {
    name = "beanstalk-service-user"
    role = "${aws_iam_role.beanstalk_service.name}"
}

resource "aws_iam_instance_profile" "beanstalk_ec2" {
    name = "beanstalk-ec2-user"
    role = "${aws_iam_role.beanstalk_ec2.name}"
}

resource "aws_iam_role" "beanstalk_service" {
    name = "beanstalk-service-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role" "beanstalk_ec2" {
    name = "beanstalk-ec2-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# resource "aws_iam_policy_attachment" "beanstalk_service" {
#     name = "elastic-beanstalk-service"
#     roles = ["${aws_iam_role.beanstalk_service.id}"]
#     policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"
# }

# resource "aws_iam_policy_attachment" "beanstalk_service_health" {
#     name = "elastic-beanstalk-service-health"
#     roles = ["${aws_iam_role.beanstalk_service.id}"]
#     policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
# }

# resource "aws_iam_policy_attachment" "beanstalk_ec2_worker" {
#     name = "elastic-beanstalk-ec2-worker"
#     roles = ["${aws_iam_role.beanstalk_ec2.id}"]
#     policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
# }

# resource "aws_iam_policy_attachment" "beanstalk_ec2_web" {
#     name = "elastic-beanstalk-ec2-web"
#     roles = ["${aws_iam_role.beanstalk_ec2.id}"]
#     policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
# }

# resource "aws_iam_policy_attachment" "beanstalk_ec2_container" {
#     name = "elastic-beanstalk-ec2-container"
#     roles = ["${aws_iam_role.beanstalk_ec2.id}"]
#     policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
# }

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "tf-test-name"
  description = "tf-test-desc"
}
# https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.docker
# https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment
resource "aws_elastic_beanstalk_environment" "tfenvtest" {
  name                = "tf-test-name"
  application         = aws_elastic_beanstalk_application.tftest.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.2 running Docker"
  tier                = "WebServer"
 
    wait_for_ready_timeout = "20m"
  
    setting {
        namespace = "aws:ec2:vpc"
        name      = "VPCId"
        value     =  "${aws_vpc.vpc.id}"
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
        value     = "nwjbrandon"
    }

    setting {
        namespace = "aws:elasticbeanstalk:environment"
        name      = "ServiceRole"
        value     = "aws-elasticbeanstalk-service-role"
    }

    setting {
        namespace = "aws:autoscaling:launchconfiguration"
        name      = "IamInstanceProfile"
        value     = "aws-elasticbeanstalk-ec2-role"
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
          value     = "${var.APP_URL}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_ACCESS_KEY_ID"
          value     = "${var.AWS_ACCESS_KEY_ID}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_LOG_GROUP_NAME"
          value     = "${var.AWS_LOG_GROUP_NAME}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_LOG_STREAM_NAME"
          value     = "${var.AWS_LOG_STREAM_NAME}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_REGION"
          value     = "${var.AWS_REGION}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_S3_EXPORTED_PDF_BUCKET"
          value     = "${var.AWS_S3_EXPORTED_PDF_BUCKET}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_S3_IMAGE_BUCKET"
          value     = "${var.AWS_S3_IMAGE_BUCKET}"
    }


    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_S3_PDF_BUCKET"
          value     = "${var.AWS_S3_PDF_BUCKET}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_S3_PDF_UPLOAD_BUCKET"
          value     = "${var.AWS_S3_PDF_UPLOAD_BUCKET}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "AWS_SECRET_ACCESS_KEY"
          value     = "${var.AWS_SECRET_ACCESS_KEY}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "DEVELOPER_GROUP_EMAIL"
          value     = "${var.DEVELOPER_GROUP_EMAIL}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "JWT_SECRET"
          value     = "${var.JWT_SECRET}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "LISTEN"
          value     = "${var.LISTEN}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "RECAPTCHA_SECRET"
          value     = "${var.RECAPTCHA_SECRET}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "REDIS_URL"
          value     = "${var.REDIS_URL}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN"
          value     = "${var.ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "dbname"
          value     = "${var.dbname}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "host"
          value     = "${var.host}"
    }
    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "password"
          value     = "${var.password}"
    }

    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "port"
          value     = "${var.port}"
    }
    setting {
          namespace = "aws:elasticbeanstalk:application:environment"
          name      = "user"
          value     = "${var.user}"
    }
}

