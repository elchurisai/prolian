resource "aws_eip" "my_eip" {

count = "${var.instance_count}"
 
  vpc= true
   
  instance = "${element(var.instance , count.index)}"

tags = "${merge(map("Name", var.instance_count > 1 ? format("%s-%02d", var.name, count.index+1) : var.name), var.tags)}"

  
}
