resource "aws_instance" "wordpress" {
  ami                         = data.aws_ami.centos.id
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.wordpress.id]
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true
  user_data                   = file("wordpress_userdata.sh")
  tags                        = { Name = "wordpress" }
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }
}
