    environment = "dev"
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_username = "ubuntu"
    key_name = "tls_private_key.generated.public_key_openssh"
    ec2_sg = "allow_ssh_dev"
    ssh_port = 22
    tags = {
       "Name" = "Terraform-EC2"
        "Environment" = "dev"
    
    }
    volume_size = 15
    volume_type = "gp3"
    