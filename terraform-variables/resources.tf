resource "aws_security_group" "my-seg" {
    name = "dev-security group"
    description = "variable -test-securty-group"
    ingress{
        description = "Allow port 22 for SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        description = "Allow port 22 for SSH"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Allow All Ip a and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}



resource "aws_instance" "my-ec2-Instance" {
 depends_on = [ aws_security_group.my-seg]
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = "main-server"
  count = var.instance_count
  user_data = file("apache-install.sh")
  tags = var.tag 
  vpc_security_group_ids = aws_security_group.my-seg.id
}