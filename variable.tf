variable "region" {}
variable "wordpress_az_location" {}
variable "database_az_location" {}
variable "key_name" {}
variable "key_location" {}
variable "cidr_block" {}
variable "public_cidr1" {}
variable "public_cidr2" {}
variable "public_cidr3" {}
variable "private_cidr1" {}
variable "private_cidr2" {}
variable "private_cidr3" {}
variable "tags" {
  type = map(string)
}
