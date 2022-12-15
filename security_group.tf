resource "aws_security_group" "eb" {
  name        = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-eb"
  description = "Allow http/https inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  ingress {
    description = "Allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-eb"
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-ec2"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-ec2"
  }
}

resource "aws_security_group" "redis" {
  name        = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-redis"
  description = "Allow redis inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow redis"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-redis"
  }
}

resource "aws_security_group" "postgres" {
  name        = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-postgres"
  description = "Allow postgres inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.ORGANIZATION_NAMESPACE}-${var.SECURITY_GROUP_NAMESPACE}-postgres"
  }
}