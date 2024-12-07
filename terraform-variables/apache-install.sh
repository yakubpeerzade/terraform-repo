#! /bin/bash
echo "Updating package repository..."
yum update -y
echo "Installing Amazon SSM Agent..."
yum install -y amazon-ssm-agent
echo "Starting and enabling the Amazon SSM Agent..."
systemctl start amazon-ssm-agent
systemctl enable amazon-ssm-agent

sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html