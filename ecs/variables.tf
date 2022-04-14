variable "region" {
  description = "AWS region to create resources in"
  type = string
  default = "us-west-2"
}

variable "aws_profile" {
  description = "The AWS profile to use"
  default = "tjprohammer-us"
}

variable "cluster_name" {
  type = string
  description = "ECS cluster name"
}

variable "service_name" {
  type = string
  description = "ECS service name"
}

variable "task_family" {
  type = string
  description = "Fargate task family"
}