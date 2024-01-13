resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy = "default"
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = local.name
    }
  )
}

resource "aws_internet_gateway" "vpc_ig" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      Name = local.name
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

 tags = merge(
    var.common_tags,
    var.public_subnets_tags,
    {
      Name = "${local.name}-public-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.main.id
  availability_zone = local.az_names[count.index]
  cidr_block = var.private_subnets_cidr[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    var.public_subnets_tags,
    {
      Name = "${local.name}-private-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnets_cidr)
  vpc_id = aws_vpc.main.id
  availability_zone = local.az_names[count.index]
  cidr_block = var.database_subnets_cidr[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    var.public_subnets_tags,
    {
      Name = "${local.name}-database-${local.az_names[count.index]}"
    }
  )
}

resource "aws_db_subnet_group" "default" {
  name       = "${local.name}"
  subnet_ids = aws_subnet.database[*].id

  tags = {
    Name = "${local.name}"
  }
}

resource "aws_eip" "eip" {
  # instance = aws_instance.web.id
  domain   = "vpc"
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
        Name = "${local.name}"
    }
  )
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.vpc_ig]
}