#VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    "Name" = "my_vpc"
  }
}


# 2 SUBNETS
resource "aws_subnet" "subnets" {
  count=length(var.subnet_cidrs)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zone.available.name[count.index]
  map_public_ip_on_launch = true
  
  tags = {
    Name = var.subnet_names[count.index]
  }
}


#INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
  
}

#ROUTE TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" #public
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

#ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "rta" {
  count = length(var.subnet_cidrs)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rt.id
}