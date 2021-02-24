resource "aws_instance" "database" {
  ami                         = data.aws_ami.centos.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.database.id]
  subnet_id                   = aws_subnet.private1.id
  associate_public_ip_address = false
  user_data                   = file("database_userdata.sh")
  tags = {
    Name = "database"
  }
}


