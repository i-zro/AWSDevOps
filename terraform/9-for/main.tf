provider "aws" {
  region = "ap-northeast-2"
}

/*
 * group output
 */

resource "aws_iam_group" "developer" {
  name = "developer"
}

resource "aws_iam_group" "employee" {
  name = "employee"
}

output "groups" {
  value = [
    aws_iam_group.developer,
    aws_iam_group.employee,
  ]
}

/*
 * 사용자 리스트
 */

variable "users" {
  type = list(any)
}

resource "aws_iam_user" "this" {
  for_each = {
    for user in var.users :
    user.name => user
  }
  
  name = each.key

  tags = {
    level = each.value.level
    role  = each.value.role
  }
}


