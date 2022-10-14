provider "aws" {
  region = "ap-northeast-2"
}

/*
 * count
 */

resource "aws_iam_user" "iam" {
  count = 10 # resource type과 관계없이 지원 (= meta-argument)

  name = "count-user-${count.index}" # string interpolation
}

output "count_user_arns" {
  value = aws_iam_user.iam.*.arn
}


