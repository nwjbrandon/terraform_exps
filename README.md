# Terraform DevOps

## Deploy
- Create keypair through AWS console (Skip if done)
- Replace files with extension *.template.tfvars to *.auto.tfvars
- Validate and plan resources
```
terraform validate 
terraform plan
```
- Deploy (Comment code for lambda and codepipeline to deploy latter)
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
redis-cli -c -h {redis_instance_endpoint} -p 6379
```
- Check postgres connection
```
psql --host={db_instance_endpoint} --port={port} --username={username} --password --dbname={database_name}
```

## Not Covered
1. Codepipeline connection
2. Create groups
3. Create domain names and SSL certs

## References
- https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.docker
- https://github.com/cloudposse/terraform-aws-elastic-beanstalk-environment
- https://automateinfra.com/2021/03/24/how-to-launch-aws-elastic-beanstalk-using-terraform/