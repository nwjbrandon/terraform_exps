resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vpc.id}"

    tags = {
        Name = "${var.ORGANIZATION_NAME}-${var.INTERNET_GATEWAY_NAME}"
    }
}

resource "aws_route" "route" {
    route_table_id         = aws_vpc.vpc.main_route_table_id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.igw.id
}
