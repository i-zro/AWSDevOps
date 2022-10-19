build {
  name = "izro-packer"

  source "amazon-ebs.ubuntu" {
    name     = "nginx"
    ami_name = "izro-packer-nginx"
  }

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "whoami",
    ]
  }

  provisioner "file" {
    source      = "${path.root}/files/index.html"
    destination = "/tmp/index.html"	# 현재 ubuntu 사용자라 tmp는 모든 사용자가 접근 가능하므로
  }

  provisioner "shell" {
    inline = [
      "echo ${source.name} and ${source.type}",
      "whoami",
      "sudo apt-get install -y nginx",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
  }

#  provisioner "breakpoint" {
#    disable = false
#    note    = "디버깅용"
#  }
}
