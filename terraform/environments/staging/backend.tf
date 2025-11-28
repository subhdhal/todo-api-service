terraform {
  backend "s3" {
    bucket         = "staging-tfstate"
    key            = "todo-service/staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "staging-tf-locks"
    encrypt        = true
  }
}

