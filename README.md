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
