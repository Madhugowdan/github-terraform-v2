
resource "aws_instance" "example" {
  ami           = data.aws_ami.windows.id
  instance_type = var.instance-type
  #availability_zone = var.sub_availability_zone 
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  # count         = var.aws_instance.example[count.index]
  # depends_on = [aws_subnet.my_subnet]

  #   network_interface {
  #   network_interface_id = aws_network_interface.foo.id
  #  device_index         = 0
  #}

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block       = var.network_cidr
  instance_tenancy = "default"
  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.sub_availability_zone

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id = aws_subnet.my_subnet.id
  # private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}



resource "aws_ebs_volume" "example" {
  availability_zone = var.sub_availability_zone
  size              = 80
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}

data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]

  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]

  }

  owners = ["801119661308"] # Canonical

}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    #ipv6_cidr_blocks = [aws_vpc.my_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}