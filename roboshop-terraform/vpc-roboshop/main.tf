module "roboshop" {
  source = "../../terraform-aws-vpc"
  vpc_tags = var.vpc_tags
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags

  public_subnets_cidr = var.public_subnets_cidr

  private_subnets_cidr = var.private_subnets_cidr

  database_subnets_cidr = var.database_subnets_cidr
  
}