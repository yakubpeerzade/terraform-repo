resource "aws_security_group" "vpc-ssh" {
    name = "vpc-ssh-${terraform.workspace}"
    description = "dev-ssh"
    ingress = {
        description = "Allow Port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress = {
        description = "allow to access internet"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "vpc-ssh" {
    name = "vpc-ssh-${terraform.workspace}"
    description = "Prod security group"
    ingress = {
        description = "allow ssh to"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress = {
        description = "allow http to"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress = {
        description = "allow internet access"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

  
}