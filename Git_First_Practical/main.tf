resource "aws_vpc" "chaittyavpc" {
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