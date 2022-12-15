# Terraform DeveOps

## Deploy
- Validate and plan resources
```
terraform validate 
terraform plan
```
- Deploy
```
terraform deploy
```
- Format code
```
terraform fmt
```

## Post Deployment
- Set the attributes in `aws_db_instance` after creation and deploy again
```
skip_final_snapshot=false
deletion_protection=true
```

## Check Host Connection
- Check redis connection
```
redis-cli -c -h nwjbrandon-production-elasticache.r78hd4.ng.0001.apse1.cache.amazonaws.com -p 6379
```
- Check postgres connection
```
psql --host=DB_instance_endpoint --port=port --username=master_user_name --password --dbname=database_name
```

## Issues
1. Push the docker images to ecr and continue deploying if first attempt failed
