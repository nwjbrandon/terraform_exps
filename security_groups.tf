resource "aws_security_group" "ssh" {
    name        = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-ssh"
    description = "Allow ssh inbound traffic"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        description      = "Allow ssh"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-ssh"
    }
}

resource "aws_security_group" "eb" {
    name        = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-eb"
    description = "Allow http/https inbound traffic"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        description      = "Allow http"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        description      = "Allow https"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-eb"
    }
}

resource "aws_security_group" "elasticache" {
    name        = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-elasticache"
    description = "Allow redis inbound traffic"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        description      = "Allow redis"
        from_port        = 6379
        to_port          = 6379
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-elasticache"
    }
}

resource "aws_security_group" "postgres" {
    name        = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-postgres"
    description = "Allow postgres inbound traffic"
    vpc_id      = aws_vpc.vpc.id

    ingress {
        description      = "Allow postgres"
        from_port        = 5432
        to_port          = 5432
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "${var.ORGANIZATION_NAME}-${var.SECURITY_GROUP_NAME}-postgres"
    }
}