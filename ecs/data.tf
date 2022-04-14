data "aws_iam_policy_document" "ecs_task_assume_policy" {
  statement {
      actions = ["sts:AsssumeRole"]
      principals {
        type = "Service"
        ideidentifiers = ["ecs-task.amazonaws.com"] 
      }
  }
}