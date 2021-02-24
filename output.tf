output "region" {
  value = var.region
}
output "public_subnets" {
  value = [aws_subnet.public1.id, aws_subnet.public2.id, aws_subnet.public3.id, ]
}
output "private_subnets" {
  value = [aws_subnet.private1.id, aws_subnet.private2.id, aws_subnet.private3.id, ]
}
output "wordpress" {
  value       = aws_instance.wordpress.public_ip
  description = "The public IP address of the wordpress server instance."
}
output "w-database" {
  value       = aws_instance.database.private_ip
  description = "The private IP address of the database server instance."

}

