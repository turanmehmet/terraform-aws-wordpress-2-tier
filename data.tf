# This line pulls CentOS AMI 
data "aws_ami" "centos" {
  most_recent = true
  owners = ["679593333241"] # CentOS Owner
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM *"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data  "aws_availability_zones" "all"{}
output "availability_zones"{
    value = data.aws_availability_zones.names
}