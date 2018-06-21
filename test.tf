terraform {
  required_version = ">= 0.11.7"
}

variable "code" {
   description = "code of cloud account: can be 1 or 2"
}

resource "null_resource" "install_jq" {
   provisioner "local-exec" {
      command = "sudo apt-get -y -q install jq"
   }
}

data "external" "test" {
  program = ["bash", "${path.root}/test.sh"]

  query = {
    code = "${var.code}"
  }

  depends_on = ["null_resource.install_jq"]
}

output "balance" {
  value = "${data.external.test.result.balance}"
}


