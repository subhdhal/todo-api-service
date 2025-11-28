terraform {
  backend "s3" {
    bucket         = "prod-tfstate"
    key            = "todo-service/prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "prod-tf-locks"
    encrypt        = true
  }
}

