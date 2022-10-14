provider "local" {
  # Configuration options
}

resource "local_file" "foo" {
    content  = "Hello World!"
    filename = "${path.module}/foo.txt"
}

data "local_file" "bar" {
    filename = "${path.module}/bar.txt"
}

output "file_bar" {
    value = data.local_file.bar
}
