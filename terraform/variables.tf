variable "aws_region" {
description = "AWS region"
type= string
default     = "eu-central-1"
}

variable "ecr_repository_name"{
description ="aws ECR repo name"
type= string
default     = "tasktracker"
}