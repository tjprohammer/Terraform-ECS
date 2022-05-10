//---------ECS BUILD-----------//
#Create ECS Cluster
resource "aws_ecs_cluster" "tjprohammer-us-cluster" {
  name = var.cluster_name
}

#Create ECS Service
resource "aws_ecs_service" "service" {
  name = var.service_name
  cluster = aws_ecs_cluster.tjprohammer-us-cluster
  launch_type = "Fargate"
  task_definition = "???"
}

#Create Task definitions
#Define the networking mode, execution role...
resource "aws_ecs_task_definition" "task" {
  familty = var.task_family
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 256
  memory = 512
  execution_role_arn = aws_iam_role.task_role_arn
}

#Create IAM_Role
resource "aws_iam_role" "task_role" {
  name = "ecs-task-${var.task_family}-${terraform.workspace}"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume_policy.json

  inline_policy {
    name = "ecs-task-permissions"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Actions = ["ecr:*"]
          Effects = "Allow"
          Resources = "*"
        }
      ]
    })
  }
}

#VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "${var.config.projectName}-${var.config.enviroment}-vpc"
  cidr = "10.0.0.0/16"
  
  azs = ["${var.config.region}a", "${var.config.region}b"]
  public_subnets = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]
  
  enable_dns_hostnames = true
  enable_dns_support = true
  
  #Default security group - ingress/egress rules cleared to deny all
  manage_default_security_group = false
  default_security_group_ingress = [{}]
  default_security_group_egress = [{}]
}
