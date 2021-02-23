resource "aws_instance" "wordpress" {
  ami                         = data.aws_ami.centos.id
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  associate_public_ip_address = true
  availability_zone           = var.wordpress_az_location
  vpc_security_group_ids      = [aws_security_group.wordpress.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }

  provisioner "file" {
    source      = "wordpress_userdata.sh"
    destination = "/tmp/wordpress_userdata.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/wordpress_userdata.sh",
      "/tmp/wordpress_userdata.sh args",
    ]
  }


#   connection {
#     type        = "ssh"
#     user        = "centos"
#     private_key = file("~/.ssh/id_rsa")
#     host        = aws_instance.wordpress.public_ip
#   }
  tags = var.tags
}