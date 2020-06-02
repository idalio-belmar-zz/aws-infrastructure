#
# Provider Configuration

variable "aws-region" {}

#
provider "aws" {
  region = var.aws-region
  access_key = "AWS_ACCES_KEY_SECRET"
  secret_key = "AWS_SECRET_KEY_SECRET"
}

provider "http" {}
