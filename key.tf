resource "aws_key_pair" "wordpressapp_key_pair" {
  key_name   = var.key_name
  public_key = file(var.key_location)
  tags       = var.tags
}

resource "tls_private_key" "keypair" {
  algorithm = "RSA"
}

resource "local_file" "privatekey" {
  content  = tls_private_key.keypair.private_key_pem
  filename = "key1.pem"
}

resource "aws_key_pair" "deployer" {
  key_name   = "key1.pem"
  public_key = tls_private_key.keypair.public_key_openssh
}
