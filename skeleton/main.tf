
locals {
  commons_tag = {
    "App" = "ECS"
  }
  app_name = "ecs-tf-using-template"

  vpc_id                 = "vpc-08940c109b1705b70"
  ecs_cluster_name       = "newClusterUsingTemplate"
  public_subnets         = ["subnet-0bbacd4b02ae0f037", "subnet-00cda367f7110c4d1"]
}

data "aws_region" "current" {}



















