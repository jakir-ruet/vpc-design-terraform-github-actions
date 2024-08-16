# Create VPC
resource "aws_vpc" "vpc_test" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    "name" = "tg_vpctest"
  }
}
# Create Subnets (2)
resource "aws_subnet" "my_subnets" {
  count                   = length(var.subnet_cidr)
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = var.subnet_cidr[count.index]
  availability_zone       = data.aws_availability_zones.my-availability-zone.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    "name" = var.subnet_names[count.index]
  }
}
# Create Internet Gateway

resource "aws_internet_gateway" "my-public-igw" {
  vpc_id = aws_vpc.vpc_test.id

  tags = {
    "name" = "tg-my-public-igw"
  }
}

# Create Route Table
resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.vpc_test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-public-igw.id
  }
}
# Create Route Table Association
resource "aws_route_table_association" "my-rt-associate" {
  count          = length(var.subnet_cidr)
  subnet_id      = aws_subnet.my_subnets[count.index].id
  route_table_id = aws_route_table.my-route-table.id

}
