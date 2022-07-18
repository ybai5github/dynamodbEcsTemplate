resource "aws_dynamodb_table" "basic-dynamodb-table"{

  name        = "my-dynamo-table"
  hash_key    = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    },
    {
      name = "title"
      type = "S"
    },
    {
      name = "age"
      type = "N"
    }
  ]

}