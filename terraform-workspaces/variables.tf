variable "aws_region" {
    description = "AWS region"
    type = string
    default = "us-east-1" 
}

variable "instance_type" {
  description = "Specify Instance type"
  type = string
  default = "t2.micro"
}