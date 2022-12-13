resource "aws_db_subnet_group" "rds_subnet" {
  name       = "${var.ORGANIZATION_NAME}-${var.POSTGRES_SUBNET_NAME}"
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
}

resource "aws_db_instance" "db_postgres" {
    identifier             = "${var.ORGANIZATION_NAME}-${var.POSTGRES_NAME}"
    allocated_storage      = 20
    db_name                = "postgres"
    engine                 = "postgres"
    engine_version         = "11.16"
    instance_class         = "db.t3.micro"
    username               = "postgres"
    password               = "postgres"
    skip_final_snapshot    = true
    db_subnet_group_name   = "${aws_db_subnet_group.rds_subnet.name}"
    deletion_protection    = false
    vpc_security_group_ids = [aws_security_group.postgres.id]
}