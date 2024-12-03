resource "aws_instance" "my-tf-ec2" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    key_name = "main-server"
    subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
    vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
    #user_data = file("apache-intall.sh")
    user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo service httpd start
    sudo systemctl enable httpd
    echo "<hi>Welcome to terraform instance ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
    tags = {
        "Name" = "my-tf-ec2"
    }
}

resource "aws_eip" "my-eip" {
    instance = aws_instance.my-tf-ec2.id
    domain = true
}