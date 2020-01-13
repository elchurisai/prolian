resource "aws_network_interface" "test" {
 # subnet_id = sort(data.aws_subnet_ids.subnets.ids)[1]
 count = "${var.instance_count}"
 subnet_id = "${element(var.subnet_id, count.index)}"  
description = "my eni"

tags = "${merge(map("Name", var.instance_count > 1 ? format("%s-%d", var.name, count.index+1) : var.name), var.tags)}"


}

