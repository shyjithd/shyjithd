resource "local_file" "test" {
    content     = "This is a test file"
    filename = "${path.module}/test"
}
