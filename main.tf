resource "aws_subnet" "this" {
  vpc_id                          = var.vpc_id
  availability_zone               = var.availability_zone
  cidr_block                      = var.cidr_block
  ipv6_cidr_block                 = var.ipv6_cidr_block
  map_public_ip_on_launch         = var.map_public_ip_on_launch
  assign_ipv6_address_on_creation = true

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = {
    "ManagedBy" = "Terraform"
  }
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}
