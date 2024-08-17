output "vpc_id" {
  value = aws_vpc.vpc_test.id
}

output "subnet_ids" {
  value = aws_subnet.my_subnets.*.id
}
