resource "aws_vpc" "Chaitus_VPC" {
  cidr_block = "12.0.0.0/16"
} 
# public SUBNET  creation
resource "aws_subnet" "PUBLIC" {
  vpc_id     = aws_vpc.Chaitus_VPC.id
  cidr_block = "12.0.0.0/24"
}

# private SUBNET creation with different cidr_block
resource "aws_subnet" "PRIVATE" {
  vpc_id     = aws_vpc.Chaitus_VPC.id
  cidr_block = "12.0.1.0/24"
}
#  ROUTE TABLE creation for public SUBNET  ,routes all traffic to IGW
resource "aws_route_table" "MYRT" {
  vpc_id = aws_vpc.Chaitus_VPC.id
  route {
    cidr_block = "0.0.0.0/0" # Route all external traffic to the internet
    gateway_id = aws_internet_gateway.MYIGW.id
  }
}

# Create a Route Table for Private Subnet (routes traffic through NAT Gateway)
resource "aws_route_table" "CRT" {
  vpc_id = aws_vpc.Chaitus_VPC.id
  route {
    cidr_block = "0.0.0.0/0" # Route all external traffic through the NAT Gateway
    gateway_id = aws_nat_gateway.mynat.id
  }
}