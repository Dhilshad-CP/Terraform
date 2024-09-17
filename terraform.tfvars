region = "us-east-1"

cidr_block       = "10.0.0.0/20"
instance_tenancy = "default"
vpc_Name = "vpc"

pub_cidr_block = "10.0.1.0/26"
pub_Name = "pub-subnet"
pri_cidr_block = "10.0.2.0/26"
pri_Name = "pri-subnet"

igw_Name = "example-igw"
route_cidr_block = "0.0.0.0/0"
route_Name = "example-route-table"
ig_cidr_blocks = "0.0.0.0/0"
port_cidr_blocks = "0.0.0.0/0"
sg_Name = "example-sg"

ami = "ami-0ebfd941bbafe70c6" # Replace with a valid AMI ID for your region
instance_type = "t2.micro"
key_name = "terraform"
ec2_Name = "terraform project"

bucket = "my-unique-bucket-name-20240832"
acl    = "private"
s3_Name        = "my-s3-bucket"
Environment = "dev"

