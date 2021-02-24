resource "aws_instance" "wordpress" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  # availability_zone           = var.wordpress_az_location
  vpc_security_group_ids      = [aws_security_group.wordpress.id]
  subnet_id                   = aws_subnet.public1.id
  associate_public_ip_address = true
  user_data                   = file("wordpress_userdata.sh")
  tags                        = var.tags
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }

  provisioner "file" {
    source      = "wordpress_userdata.sh"
    destination = "/tmp/wordpress_userdata.sh"

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.wordpress.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/wordpress_userdata.sh",
      "/tmp/wordpress_userdata.sh args",
    ]

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
      host        = aws_instance.wordpress.public_ip
    }
  }

}
