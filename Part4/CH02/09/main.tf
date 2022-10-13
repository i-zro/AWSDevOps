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
