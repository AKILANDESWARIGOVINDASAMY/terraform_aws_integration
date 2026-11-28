resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "devops-project"
  }
}


resource "aws_subnet" "mysubnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "devops-project"
  }
}

resource "aws_subnet" "mysubnet2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "devops-project"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "devops-project"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "devops-project"
  }
}



#for joining subnets to use IGW by refering route table. if not subnet considered as private
resource "aws_route_table_association" "route_table_association1" {
  subnet_id      = aws_subnet.mysubnet1.id
  route_table_id = aws_route_table.my_route_table.id
}


resource "aws_route_table_association" "route_table_association2" {
  subnet_id      = aws_subnet.mysubnet2.id
  route_table_id = aws_route_table.my_route_table.id
}

