# 이름 없이
build {
  sources = [
    # 어떤 소스블록 빌드할 지
    "source.null.one",
    "source.null.two",
  ]
}

# 이름 추가
build {
  name = "izro-packer"

  sources = [
    "source.null.one",
    "source.null.two",
  ]
}

# 빌더 각각 이름 변경
build {
  name = "izro-packer-fill-in"

  source "null.one" {
    name = "terraform"
  }

  source "null.two" {
    name = "vault"
  }
}
