{% if values.enableDynamoDB %}

resource "aws_ecs_task_definition" "taskUsingTemplate" {
  family                = "${local.app_name}-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "ecs"
      image = ${{ values.imageURL }}
      //image     = var.imageURL
      essential = true
      portMappings = [
        {
          containerPort = ${{ values.portToMap | int }}
          hostPort      = ${{ values.portToMap | int }}
        }
      ]
    }
  ])
}

{% endif %}