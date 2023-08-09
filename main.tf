provider "aws" {
    
  
}

resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name: "development"
    }
  
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24" 
    availability_zone = "us-east-2a"
    
    tags = {
      Name: "dev-subnet"
    }
}


variable "subnet_cidr_block" {
    description = "subnet_cide_block"
  
}

# using data

data "aws_vpc" "existing_vpc" {
    default = true
  
}

resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = var.subnet_cide_block
    availability_zone = "us-east-2b"
    
  
}


# checking the vpc id as a outbput

output "existing_vpc-id" {
    value = aws_subnet.dev-subnet-2.id
  
}


