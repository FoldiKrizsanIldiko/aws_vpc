# dynamodb tábla, stringeket amik mező neve "MD5"

resource "aws_dynamodb_table" "this" {
  name             = "example"
  hash_key         = "MD5"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "MD5"
    type = "S"
  }
  
}

