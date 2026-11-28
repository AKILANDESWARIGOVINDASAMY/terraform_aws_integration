output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.myvpc.id
}

output "subnet_ids" {
  description = "my subnet ids both"
  value       = [aws_subnet.mysubnet1.id, aws_subnet.mysubnet2.id]
}


output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  value = aws_route_table.my_route_table.id
}
