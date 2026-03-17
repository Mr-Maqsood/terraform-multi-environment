    environment = "dev"
    ami = "ami-0b0b78dcacbab728f"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_username = "ec2-user"
    key_name = "Terraform_dev_user"
    ec2_sg = "allow_ssh_dev"
    ssh_port = 22
    tags = {
       "Name" = "Terraform-EC2"
        "Environment" = "dev"
    
    }
    volume_size = 15
    volume_type = "gp3"
    

    