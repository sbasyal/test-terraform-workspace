terraform {
  backend "atlas" {
    name    = "hashicorp-support/3930-PEV"
    address = "https://atlas.hashicorp.com"
  }
}


variable "aws_access_key" {}
variable "aws_secret_key" {}


provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-west-2"
}


resource "aws_instance" "sabin-example" {
  ami             = "ami-7c803d1c"
  instance_type   = "t2.micro"
  key_name        = "sabin"

  tags {
    "Identity" = "test-PEV"
  }
}
