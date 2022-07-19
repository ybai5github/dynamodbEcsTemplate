

resource "aws_ecs_task_definition" "taskUsingTemplate" {
  family                = "${local.app_name}-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  network_mode             = "awsvpc"
  container_definitions = jsonencode([
    {
      name      = "ecs"
      image     = "${{ values.imageURL }}"
      essential = true
      portMappings = [
        {
          containerPort = ${{ values.portToMap | int }}
          hostPort      = ${{ values.portToMap | int }}
        }
      ]

      environment = [
        {% if values.enableDynamoDB %}
        {
        name = "DYNAMODB_ARN"
        value = aws_dynamodb_table.basic-dynamodb-table.arn
        },
        {% endif %}

        {% if values.serviceName != "" %}
        {
          name = "THE_SERVICE_NAME"
          value = "${{ values.serviceName }}"
        }
        {% endif %}
      ]


    }
  ])
}

