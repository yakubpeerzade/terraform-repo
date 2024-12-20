variable "aws_region" {
    description = "Define AWS region"
    type = string
    default = "us-east-1"
     
}

variable "ami_id" {
    type = string
    description = "Instance AMI ID"
    default = "ami-0453ec754f44f9a4a"
}

variable "instance_type" {
    type = string
    description = "EC2 Insrtance Type"
    default = "t3.micro"
  
}

variable "instance_count" {
    type = number
    description = "Instance count"
    default = 1
}

variable "tagsi" {
    type = map(string)
    default = {
      "name" = "apache-server"
      "project-tag" = "XYZ"
    }

  
}