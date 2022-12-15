resource "aws_elasticache_subnet_group" "elasticache_subnet" {
  name       = "${var.ORGANIZATION_NAMESPACE}-${var.ELASTICACHE_SUBNET_NAMESPACE}"
  subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id, aws_subnet.private-subnet-3.id]
}

resource "aws_elasticache_replication_group" "elasticache_redis" {
  replication_group_id       = "${var.ORGANIZATION_NAMESPACE}-${var.ELASTICACHE_SUBNET_NAMESPACE}"
  description                = "${var.ORGANIZATION_NAMESPACE}-${var.ELASTICACHE_SUBNET_NAMESPACE}"
  engine                     = "redis"
  engine_version             = "6.2"
  node_type                  = "cache.t4g.micro"
  port                       = 6379
  subnet_group_name          = aws_elasticache_subnet_group.elasticache_subnet.name
  num_node_groups            = 1
  at_rest_encryption_enabled = true
  security_group_ids         = [aws_security_group.redis.id]
}
