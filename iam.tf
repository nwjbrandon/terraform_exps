resource "aws_iam_role" "lambda_iam_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}-${var.IAM_ROLE_NAMESPACE}-lambda"
  assume_role_policy = file("aws_policies/lambda_iam_role_policy.json")
}

resource "aws_iam_role" "eb_iam_service_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}_eb_iam_service_role"
  assume_role_policy = file("aws_policies/eb_iam_service_role_policy.json")
}

resource "aws_iam_role" "eb_iam_ec2_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}_eb_iam_ec2_role"
  assume_role_policy = file("aws_policies/eb_iam_ec2_role_policy.json")
}

resource "aws_iam_role" "codebuild_iam_service_role" {
  name               = "${var.ORGANIZATION_NAMESPACE}_codebuild_iam_service_role"
  assume_role_policy = file("aws_policies/codebuild_iam_service_role_policy.json")
}

resource "aws_iam_instance_profile" "eb_iam_service_profile" {
  name = "${var.ORGANIZATION_NAMESPACE}_eb_iam_service_profile"
  role = aws_iam_role.eb_iam_service_role.name
}

resource "aws_iam_instance_profile" "eb_iam_ec2_profile" {
  name = "${var.ORGANIZATION_NAMESPACE}_eb_iam_ec2_profile"
  role = aws_iam_role.eb_iam_ec2_role.name
}

resource "aws_iam_policy_attachment" "eb_managed_updates_customer_role_policy" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_managed_updates_customer_role_policy"
  roles      = ["${aws_iam_role.eb_iam_service_role.id}", "${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
}

resource "aws_iam_policy_attachment" "eb_enhanced_health" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_enhanced_health"
  roles      = ["${aws_iam_role.eb_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_policy_attachment" "eb_ec2_container_registry_full_access" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_ec2_container_registry_full_access"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}", "${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_policy_attachment" "eb_ecr_public_read_only" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_ecr_public_read_only"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicReadOnly"
}

resource "aws_iam_policy_attachment" "eb_web_tier" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_web_tier"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}", "${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_policy_attachment" "eb_multicontainer_docker" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_multicontainer_docker"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}", "${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_policy_attachment" "eb_ecr_worker_tier" {
  name       = "${var.ORGANIZATION_NAMESPACE}_eb_ecr_worker_tier"
  roles      = ["${aws_iam_role.eb_iam_ec2_role.id}", "${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_policy_attachment" "AWSCodeBuildDeveloperAccess" {
  name       = "AWSCodeBuildDeveloperAccess"
  roles      = ["${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}

resource "aws_iam_policy_attachment" "AWSCodePipeline_FullAccess" {
  name       = "AWSCodePipeline_FullAccess"
  roles      = ["${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
}

resource "aws_iam_policy_attachment" "CloudWatchLogsFullAccess" {
  name       = "CloudWatchLogsFullAccess"
  roles      = ["${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_iam_policy_attachment" "AmazonElasticContainerRegistryPublicFullAccess" {
  name       = "AmazonElasticContainerRegistryPublicFullAccess"
  roles      = ["${aws_iam_role.codebuild_iam_service_role.id}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicFullAccess"
}
