resource "aws_instance" "jenkins" {
  ami                         = data.aws_ami.centos.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.wordpressapp-key-pair.key_name
  associate_public_ip_address = true
  availability_zone           = data.aws_availability_zones.all.names
  vpc_security_group_ids      = [aws_security_group.jenkins.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install wget -y",
      "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum install jenkins java-1.8.0-openjdk-devel -y",
      "sudo systemctl start jenkins",
      "sudo systemctl enable jenkins"
      # "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
  }


  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.jenkins.public_ip
  }
  tags = {
    Name = "jenkins"
  }
}