resource "aws_security_group" "securitygrp" {

count = "${var.instance_count}"
name = "${var.name}-${count.index}"
description = "Allow inbound and outbound traffic"
vpc_id = "${var.vpc_id}"


ingress {

 #cidr_blocks = ["123.123.123.123/32","123.123.123.15/32"]

cidr_blocks = "${var.cidr_blocks}" 
from_port = "${var.from_port}"
 protocol = "${var.protocol}"
 to_port = "${var.to_port}"
 description = "sample ingress rule for terraform"
}

egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}


#tags = "${merge(map("name", var.count > 1 ? format("%s-%d", var.name, count.index+1) : var.name), var.tags)}"

}
