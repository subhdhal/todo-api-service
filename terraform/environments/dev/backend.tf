terraform {
  backend "s3" {
    bucket         = "dev-tfstate"
    key            = "todo-service/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-tf-locks"
    encrypt        = true
  }
}
