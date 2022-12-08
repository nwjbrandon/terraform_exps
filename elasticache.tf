
# resource "aws_elasticache_subnet_group" "bar" {
#   name       = "tf-test-cache-subnet"
#   subnet_ids = [aws_subnet.prod-subnet-private-1.id]
# }


# resource "aws_elasticache_cluster" "redis" {
#   cluster_id           = "cluster-example"
#   engine               = "redis"
#   engine_version       = "6.2"
#   node_type            = "cache.t4g.micro"
#   num_cache_nodes      = "1"
#   port                 = "6379"
#   subnet_group_name    = aws_elasticache_subnet_group.bar.name

# }