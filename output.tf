output "vpc" {
	value = aws_vpc.main.id
}
output "public_subnets" {
	value = [
		aws_subnet.public1.id,
		aws_subnet.public2.id,
		aws_subnet.public3.id,
	]
}
output "private_subnets" {
	value = [
		aws_subnet.private1.id,
		aws_subnet.private2.id,
		aws_subnet.private3.id,
	]
}
output "region" {
	value = var.region
}
