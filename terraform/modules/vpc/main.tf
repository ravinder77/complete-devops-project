
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = var.vpc_name
  }
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

#Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-subnet${count.index}"
    Type = "Public"
    ManagedBy = "Terraform"
  }
}

#Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
    Type = "Private"
    ManagedBy = "Terraform"
  }

}

# Database Subnets
resource "aws_subnet" "database" {
  vpc_id = aws_vpc.this.id
}

# Elastic IP for NAT
resource "aws_eip" "nat" {
  count = length(var.public_subnets)
  
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  subnet_id = ""
}

#Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
}

#Private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "" {}


#Public Route Association
resource "aws_route_table_association" "public" {
  route_table_id = ""
}

# Private route association
resource "aws_route_table_association" "private" {
  route_table_id = ""
}