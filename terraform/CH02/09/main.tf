provider "aws" {
  region = "ap-northeast-2"
}

variable "is_true" {
  type = bool
  default = false
}

locals {
  message = var.is_true ? "Hello World" : "Bye World"
}

output "message" {
  value = local.message
}



variable "internet_gateway_enabled" {
  type = bool
  default = true
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "this" {
  count = var.internet_gateway_enabled ? 1 : 0 # 초기에 true라 1개 resource 1개 만들 예정
  vpc_id = aws_vpc.this.id
}
