module "roboshop" {
  source = "../terraform-aws-vpc"
  vpc_tags = var.vpc_tags
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  
}