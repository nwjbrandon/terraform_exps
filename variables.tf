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

variable "LAMBDA_IAM_NAME" {
    default = "lambda-iam"
}