# Create an EC2 instance
resource "aws_instance" "ec2" {
  ami           = var.ami # Replace with a valid AMI ID for your region
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.pub.id
  security_groups = [aws_security_group.mysg.id]

  tags = {
    Name = var.ec2_Name
  }
}
