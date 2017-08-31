# Test Terraform template and local file

This is a test project to play with terraform template and local file

```
terraform -v
Terraform v0.10.2
```

cd to `basic` or `modules`
Run `terraform init`

Run `terraform apply`

verify `results.yaml` is created without error

## Output

works as expected without module

```
/yaml-concat/basic *
$ terraform apply
data.template_file.namespaces.0: Refreshing state...
data.template_file.namespaces.1: Refreshing state...
data.template_file.namespaces.2: Refreshing state...
local_file.bootstrap_namespaces: Creating...
  content:  "" => "this is a test one\n---\nthis is a test two\n---\nthis is a test three\n"
  filename: "" => "result.yaml"
local_file.bootstrap_namespaces: Creation complete (ID: a68c1b979d98b6a38e97d3fd943833bbb4970ef6)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

works as expected in module
```
/yaml-concat/module *
$ terraform apply
data.template_file.namespaces.2: Refreshing state...
data.template_file.namespaces.0: Refreshing state...
data.template_file.namespaces.1: Refreshing state...
local_file.bootstrap_namespaces: Refreshing state... (ID: a68c1b979d98b6a38e97d3fd943833bbb4970ef6)
module.test.local_file.bootstrap_namespaces: Creating...
  content:  "" => "this is a test one\n---\nthis is a test two\n---\nthis is a test three\n"
  filename: "" => "result.yaml"
module.test.local_file.bootstrap_namespaces: Creation complete (ID: a68c1b979d98b6a38e97d3fd943833bbb4970ef6)

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

