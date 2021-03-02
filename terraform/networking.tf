resource "aws_vpc" "SRE_VPC" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "SRE_VPC"
    Team = "SRE"
    Owner = "JOAS-1"
    
  }
}

resource "aws_vpc_dhcp_options" "SRE_DHCP_OPTIONS" {
  domain_name          = var.domain_name
  domain_name_servers  = ["10.0.0.37", "10.0.0.71"]
  ntp_servers          = ["10.0.0.37", "10.0.0.71"]
  netbios_name_servers = ["10.0.0.37", "10.0.0.71"]
  netbios_node_type    = 2

  tags = {
    Name = "SRE_DHCP_OPTIONS",
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = aws_vpc.SRE_VPC.id
  dhcp_options_id = aws_vpc_dhcp_options.SRE_DHCP_OPTIONS.id
}

resource "aws_subnet" "Public_SRE_Subnet" {  
  vpc_id                  = aws_vpc.SRE_VPC.id
  cidr_block              = "10.0.0.0/27"
  map_public_ip_on_launch = true  
  tags = {
    Name = "Public_SRE_Subnet"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_subnet" "Private_SRE_Subnet_01" {
  vpc_id     = aws_vpc.SRE_VPC.id
  cidr_block = "10.0.0.32/27"

  tags = {
    Name = "Private_SRE_Subnet_01"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_subnet" "Private_SRE_Subnet_02" {
  vpc_id     = aws_vpc.SRE_VPC.id
  cidr_block = "10.0.0.64/27"

  tags = {
    Name = "Private_SRE_Subnet_02"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_subnet" "Private_SRE_Subnet_03" {
  vpc_id     = aws_vpc.SRE_VPC.id
  cidr_block = "10.0.0.96/27"

  tags = {
    Name = "Private_SRE_Subnet_03"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_subnet" "Private_SRE_Subnet_04" {
  vpc_id     = aws_vpc.SRE_VPC.id
  cidr_block = "10.0.0.128/27"

  tags = {
    Name = "Private_SRE_Subnet_04"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_route_table" "Main_Route_Table" {
  vpc_id = aws_vpc.SRE_VPC.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.SRE_NAT_GW.id
  }
  tags = {
    "Name" = "Main Route Table"
    "Team" = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.SRE_VPC.id
  route_table_id = aws_route_table.Main_Route_Table.id
}

resource "aws_route_table" "Public_Route_Table" {
  vpc_id = aws_vpc.SRE_VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.SRE_IGW.id
  }
  tags = {
    "Name" = "Public Route Table"
    "Team" = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_internet_gateway" "SRE_IGW" {
  vpc_id = aws_vpc.SRE_VPC.id
  tags = {
    "Name" = "SRE_IGW"
    "Team" = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_eip" "NAT_GW_IP" {
  tags = {
    "Name" = "SRE_NAT_GW_EIP"
    "Team" = "SRE"
    Owner = "JOAS-1"
  }
}


resource "aws_nat_gateway" "SRE_NAT_GW" {
  allocation_id = aws_eip.NAT_GW_IP.id
  subnet_id     = aws_subnet.Public_SRE_Subnet.id
  tags = {
    "Name" = "SRE_NAT_GW"
    "Team" = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_security_group" "Jumpbox_SG" {
  name   = "Jumpbox_SG"
  vpc_id = aws_vpc.SRE_VPC.id
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.teamips
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Jumpbox_SG"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_security_group" "DC_SG" {
  name   = "DC_SG"
  vpc_id = aws_vpc.SRE_VPC.id
  ingress {
    description     = "RDP"
    from_port       = 3389
    to_port         = 3389
    protocol        = "tcp"
    security_groups = [aws_security_group.Jumpbox_SG.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "DC_SG"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

/*
resource "aws_route_table_association" "igw" {
  gateway_id      = aws_internet_gateway.SRE_IGW.id
  route_table_id = aws_route_table.Public_Route_Table.id
}

resource "aws_route_table_association" "nat_gw" {
  gateway_id      = aws_nat_gateway.SRE_NAT_GW.id
  route_table_id = aws_route_table.Main_Route_Table.id
}
*/
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Public_SRE_Subnet.id
  route_table_id = aws_route_table.Public_Route_Table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Private_SRE_Subnet_01.id
  route_table_id = aws_route_table.Main_Route_Table.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.Private_SRE_Subnet_02.id
  route_table_id = aws_route_table.Main_Route_Table.id
}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.Private_SRE_Subnet_03.id
  route_table_id = aws_route_table.Main_Route_Table.id
}
resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.Private_SRE_Subnet_04.id
  route_table_id = aws_route_table.Main_Route_Table.id
}
