variable "namespaces" {
    default = ["one", "two", "three"]
}

data "template_file" "namespaces" {
  count = "${length(var.namespaces)}"
  template = "${file("sample.tpl")}"
  vars {
    namespace = "${element(var.namespaces, count.index)}"
  }
}
resource "local_file" "bootstrap_namespaces" {
  content  = "${join("---\n", data.template_file.namespaces.*.rendered)}"
  filename = "result.yaml"
}
