# ubuntu 인스턴스 리소스
resource "aws_instance" "ubuntu" {
  ami           = "ami-09fa03ef1bc0d6544"	# 서버 이미지 id
  instance_type = "t2.micro"

  tags = {
    Name = "ubuntu-test"
  }
}
