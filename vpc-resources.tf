resource "aws_vpc" "vpc-dev" {
   cidr_block = "10.0.0.0/16"
   tags= {

    "Name" = "vpc-dev"
   } 

}

resource "aws_subnet" "vpc-dev-public-subnet-1"{
    vpc_id = aws_vpc.vpc-dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1"
    map_public_ip_on_launch = "true"

}

resource "aws_internet_gateway" "vpc-dev-igw"{
    vpc_id = aws_vpc.vpc-dev.id
}

resource "aws_route_table" "vpc-dev-public-route-table" {
    vpc_id = aws_vpc.vpc-dev.id
  
}

resource "aws_route" "vpc-dev-public-route" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-dev-igw.id

}

resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id = aws.subnet.vpc-dev-public-subnet.id
}

resource "aws_security_group" "dev-vpc-sg" {
  name= "dev-vpc-default-sg"
  description = "Dev VPC Default security group"
  vpc_id = aws_vpc.vpc-dev.id

  ingress {
    description = "allow from 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    description = "allow all ip port from outbound"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 

}