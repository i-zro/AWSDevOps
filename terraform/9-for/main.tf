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
    user.name => user  # each의 user.name이 key, user가 value
  }
  
  name = each.key

  tags = {
    level = each.value.level
    role  = each.value.role
  }
}

resource "aws_iam_user_group_membership" "this" {
  for_each = {
    for user in var.users :
    user.name => user
  }

  user = each.key
  groups = each.value.is_developer ? [aws_iam_group.developer.name, aws_iam_group.employee.name] : [aws_iam_group.employee.name]
}

locals {
  developers = [
    for user in var.users:
    user  # is_developer가 참일 때만 user 반환
    if user.is_developer
  ]
}

resource "aws_iam_user_policy_attachment" "developer" {  # 사용자 권한 정책 부여 리소스
  for_each = {
    for user in local.developers :
    user.name => user
  }

  user = each.key
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"  # 관리자 권한

  depends on = [
    aws_iam_user.this
  ]
}

#output "developers" {
#  value = local.developers
#}
#
#output "high_level_users" {
#  value = [
#    for user in var.users :
#    user
#    if user.level > 5
#  ]
#}
