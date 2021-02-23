resource "aws_key_pair" "wordpressapp-key-pair" {
  key_name   = var.key_name
  public_key = file(var.key_location)
}
