resource "aws_network_interface_sg_attachment" "sg_attachment" {

  count = "${var.instance_count}"


  security_group_id    = "${element(var.security_group_id, count.index)}"


  network_interface_id = "${element(var.network_interface_id, count.index)}"
}

