{% if values.enableDynamoDB %}

resource "aws_dynamodb_table" "basic-dynamodb-table"{
  name        = "my-dynamo-table"
  hash_key    = "id"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }


  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }


  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

{% endif %}

