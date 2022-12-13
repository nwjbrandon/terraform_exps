variable "AWS_REGION" {    
    default = "ap-southeast-1"
}

variable "ORGANIZATION_NAME" {
    default = "nwjbrandon-production"
}

variable "VPC_NAME" {
    default = "vpc"
}

variable "VPC_SUBNET_NAME" {
    default = "vpc-subnet"
}

variable "INTERNET_GATEWAY_NAME" {
    default = "igw"
}

variable "SECURITY_GROUP_NAME" {
    default = "security_group"
}

variable "LAMBDA_IAM_ROLE_NAME" {
    default = "lambda-iam-role"
}

variable "LAMBDA_CV_NAME" {
    default = "cv"
}

variable "ECR_ROOT_NAME" {
    default = "502358162358.dkr.ecr.ap-southeast-1.amazonaws.com"
}