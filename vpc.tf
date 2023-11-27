#vpc with subnet, rout table, sg

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65"
    }
  }
}

provider "aws" {
    region = "eu-west-2"
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "first" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.0.0/17"
}


resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id


}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.first.id
  route_table_id = aws_route_table.this.id
}