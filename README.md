# terraform-aws-wordpress-2-tier
Intallation wordpress server with 2 tier application


Add the module source 
```
module "two-tier-wordpress" {
  source = "terraform-aws-wordpress-2-tier/"
}
```

Variables are defined in the terraform.tfvars file

And run the following commands

`terraform init`

`terraform apply -var-file terraform.tfvars --auto-approve`


# Module information
Create VPC with: 

3 Public Subnets attached to different AZ

3 Private Subnets attached to different AZ

Each resource will have the following softcoded tags on them. 

	1. Name = VPC_PROJECT
	2. Environment = Dev
	3. Department = IT 
	4. Team    = Infrastructure
	5. Created_by = Your_name

On top of Public Subnet one wordpress ec2 instance with a bastion key attached. The instance will have sec group that allows port 22 and 80. And install wordpress with userdata 

On the private subnet one instance that has mysql with port 3306 on the security group and install mariadb

Necessary output of the resources will be printed out at the end. 

```
region = "us-east-1"
region_name = "virginia"
vpc_cidr = "10.0.0.0/16"
public_cidr1 = "10.0.101.0/24"
public_cidr2 = "10.0.102.0/24"
public_cidr3 = "10.0.103.0/24"
private_cidr1 = "10.0.1.0/24"
private_cidr2 = "10.0.2.0/24"
private_cidr3 = "10.0.3.0/24"
tags = {
        Environment = "Dev"
        Team = "DevOps"
        Created_by = "Farrukh"
        Department = "IT"
}
```
