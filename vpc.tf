resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" # gives an internal domain name
    enable_dns_hostnames = "true" # gives an internal host name
    
    tags = {
        Name = "prod-vpc"
    }
}

resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" // initialises on public subnet
    availability_zone = "ap-southeast-1a"

    tags = {
        Name = "prod-subnet-public-1"
    }
}

resource "aws_subnet" "prod-subnet-private-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false" // initialises on private subnet
    availability_zone = "ap-southeast-1a"

    tags = {
        Name = "prod-subnet-private-1"
    }
}
