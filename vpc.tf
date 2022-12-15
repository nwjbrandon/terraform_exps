resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true" # enables an internal domain name
  enable_dns_hostnames = "true" # enables an internal host name

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_NAMESPACE}"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" // map on public subnet
  availability_zone       = "ap-southeast-1a"

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_SUBNET_NAMESPACE}-public-1"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "false" // maps on private subnet
  availability_zone       = "ap-southeast-1a"

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_SUBNET_NAMESPACE}-private-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true" // map on public subnet
  availability_zone       = "ap-southeast-1b"

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_SUBNET_NAMESPACE}-public-2"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false" // maps on private subnet
  availability_zone       = "ap-southeast-1b"

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_SUBNET_NAMESPACE}-private-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true" // map on public subnet
  availability_zone       = "ap-southeast-1c"

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_SUBNET_NAMESPACE}-public-3"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false" // maps on private subnet
  availability_zone       = "ap-southeast-1c"

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.VPC_SUBNET_NAMESPACE}-private-3"
  }
}
