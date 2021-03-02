resource "aws_network_interface" "Jumpbox_SRE" {
  subnet_id       = aws_subnet.Public_SRE_Subnet.id  
  security_groups = [aws_security_group.Jumpbox_SG.id]
  tags = {
    Name = "Jumpbox_SRE_NIC"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_instance" "Jumpbox_SRE" {
  ami           = var.LinuxAMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.TheGoodStuff.key_name
  network_interface {
    network_interface_id = aws_network_interface.Jumpbox_SRE.id
    device_index         = 0
  }

  tags = {
    Name = "Jumpbox_SRE",
    Team = "SRE"
    Owner = "JOAS-1"
  }
}
/*
resource "aws_network_interface" "Jumpbox02" {
  subnet_id = aws_subnet.Public_SRE_Subnet.id
  security_groups = [aws_security_group.Jumpbox_SG.id]
  tags = {
    Name = "Jumpbox02_NIC"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_instance" "Jumpbox02" {
  ami           = "ami-02642c139a9dfb378"
  instance_type = "t2.micro"
  key_name = aws_key_pair.TheGoodStuff.key_name
  get_password_data = true
  network_interface {
    network_interface_id = aws_network_interface.SRE_DC01.id
    device_index         = 0
  }
  tags = {
    Name = "Jumpbox02",
    Team = "SRE"
    Owner = "JOAS-1"
  }
}
*/
resource "aws_network_interface" "SRE_DC01" {
  subnet_id       = aws_subnet.Private_SRE_Subnet_01.id
  private_ips = ["10.0.0.37"]
  security_groups = [aws_security_group.DC_SG.id]
  tags = {
    Name = "SRE_DC01_NIC"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_instance" "SRE_DC01" {
  ami               = var.WindowsAMI
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.TheGoodStuff.key_name
  user_data         = data.template_file.initial_script1.rendered
  get_password_data = true
  network_interface {
    network_interface_id = aws_network_interface.SRE_DC01.id
    device_index         = 0
  }
  tags = {
    Name = var.dc01,
    Team = "SRE"
    Owner = "JOAS-1"
  }
}

resource "aws_network_interface" "SRE_DC02" {
  subnet_id       = aws_subnet.Private_SRE_Subnet_02.id   
  private_ips = ["10.0.0.71"]
  security_groups = [aws_security_group.DC_SG.id]
  tags = {
    Name = "SRE_DC02_NIC"
    Team = "SRE"
    Owner = "JOAS-1"
  }
}
resource "aws_instance" "SRE_DC02" {
  ami               = var.WindowsAMI
  instance_type     = "t2.micro"
  key_name          = aws_key_pair.TheGoodStuff.key_name
  user_data         = data.template_file.initial_script2.rendered
  get_password_data = true
  network_interface {
    network_interface_id = aws_network_interface.SRE_DC02.id
    device_index         = 0
  }
  tags = {
    Name = var.dc02,
    Team = "SRE"
    Owner = "JOAS-1"
  }  
}

output "JumpboxIP" {
  value = aws_instance.Jumpbox_SRE.public_ip
}

output "SRE_DC01-IP" {
  value = aws_instance.SRE_DC01.private_ip
}

output "SRE_DC01-Password" {
  value = rsadecrypt(aws_instance.SRE_DC01.password_data, file("TheGoodStuff.pem"))
  sensitive = true
}

output "SRE_DC02-IP" {
  value = aws_instance.SRE_DC02.private_ip
}

output "SRE_DC02-Password" {
  value = rsadecrypt(aws_instance.SRE_DC02.password_data, file("TheGoodStuff.pem"))
  sensitive = true
}


data "template_file" "initial_script1" {
  vars = {
    server_name = var.dc01
  }
  template = <<EOF
  <powershell>    
  Rename-Computer $${server_name} -Restart;
  </powershell>
  EOF  
}

data "template_file" "initial_script2" {
  vars = {
    server_name = var.dc02
  }
  template = <<EOF
  <powershell>
  Rename-Computer $${server_name} -Restart;
  </powershell>
  EOF  
}
