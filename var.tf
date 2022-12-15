variable "AWS_ACCOUNT_NUMBER" {
}

variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "ELASTICACHE_NAMESPACE" {
  default = "elasticache"
}

variable "ELASTICACHE_SUBNET_NAMESPACE" {
  default = "elasticache-subnet"
}

variable "GITHUB_ACCESS_TOKEN" {
}

variable "IAM_ROLE_NAMESPACE" {
  default = "iam-role"
}

variable "INTERNET_GATEWAY_NAMESPACE" {
  default = "igw"
}

variable "KEYPAIR_NAME" {
}

variable "LAMBDA_CV_NAMESPACE" {
  default = "cv"
}

variable "ORGANIZATION_NAMESPACE" {
}

variable "POSTGRES_NAMESPACE" {
  default = "postgres"
}

variable "POSTGRES_SUBNET_NAMESPACE" {
  default = "postgres-subnet"
}

variable "SECURITY_GROUP_NAMESPACE" {
  default = "security-group"
}

variable "VPC_NAMESPACE" {
  default = "vpc"
}

variable "VPC_SUBNET_NAMESPACE" {
  default = "vpc-subnet"
}

################
# Env: Amplify #
################
variable "AMPLIFY_DIFF_DEPLOY" {
}

variable "REACT_APP_BASE_URL" {
}

variable "REACT_APP_BASE_URL_DEV" {
}

variable "REACT_APP_DD_APP_ID" {
}

variable "REACT_APP_DD_CLIENT_TOKEN" {
}

variable "REACT_APP_DD_ENV" {
}

variable "REACT_APP_RECAPTCHA_SITE_KEY" {
}

variable "REACT_APP_ROLLBAR_POST_CLIENT_ITEM_KEY" {
}

##########################
# Env: Elastic Beanstalk #
##########################
variable "APP_URL" {
}

variable "AWS_ACCESS_KEY_ID" {
}

variable "AWS_LOG_GROUP_NAME" {
}

variable "AWS_LOG_STREAM_NAME" {
}

variable "AWS_S3_EXPORTED_PDF_BUCKET" {
}

variable "AWS_S3_IMAGE_BUCKET" {
}

variable "AWS_S3_PDF_BUCKET" {
}

variable "AWS_S3_PDF_UPLOAD_BUCKET" {
}

variable "AWS_SECRET_ACCESS_KEY" {
}

variable "DEVELOPER_GROUP_EMAIL" {
}

variable "JWT_SECRET" {
}

variable "LISTEN" {
}

variable "RECAPTCHA_SECRET" {
}

variable "REDIS_URL" {
}

variable "ROLLBAR_POST_SERVER_ITEM_ACCESS_TOKEN" {
}

variable "dbname" {
}

variable "host" {
}

variable "password" {
}

variable "port" {
}

variable "user" {
}