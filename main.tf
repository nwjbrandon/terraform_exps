module "vpc_resource_group" {
  source                 = "./vpcs"
  ORGANIZATION_NAMESPACE = var.ORGANIZATION_NAMESPACE
}