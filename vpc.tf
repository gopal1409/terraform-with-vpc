#internet VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags = {
    Name = "gopal vpc"
  }
}

#subnets
resource "aws_subnet" "app-public-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "app-public-1"
  }
}

resource "aws_subnet" "app-public-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "app.public-2"
  }
}

resource "aws_subnet" "app-public-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2c"
  tags = {
    Name = "app.public-3"
  }
}