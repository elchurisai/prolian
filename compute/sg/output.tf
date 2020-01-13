output "mysgid" {

  value = "${aws_security_group.securitygrp.*.id}"

}


output "sgarn" {

  value = "${aws_security_group.securitygrp.*.arn}"

}
