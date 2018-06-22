terraform {
  required_version = ">= 0.11.7"
}

variable "code" {
   description = "code of cloud account: can be 1 or 2"
}

data "external" "test" {
  program = ["./test.sh", "${var.code}"]
}

output "balance" {
  value = "${data.external.test.result["balance"]}"
}


