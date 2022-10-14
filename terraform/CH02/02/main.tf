provider "local" {
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

# Create a VPC
resource "aws_vpc" "foo" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "This is test vpc"
  }
}

output "vpc_foo" {
  value = aws_vpc.foo
}

data "aws_vpcs" "bar" {}

output "vpcs" {
  value = data.aws_vpcs.bar
}
