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

