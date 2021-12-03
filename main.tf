resource "local_file" "foo" {
    content     = "This is a test file "
    filename = "${path.module}/test"
}
