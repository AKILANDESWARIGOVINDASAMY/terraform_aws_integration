resource "aws_ecr_repository" "tasktracker" {
  name                 = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "TaskTracker"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"
  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.subnet_ids


}
