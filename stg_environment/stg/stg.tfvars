    environment = "stg"
    ami = "ami-0f5fcdfbd140e4ab7"
    instance_count = 1
    instance_type = "t3.small"
    ec2_username = "ubuntu"
    key_name = "tls_private_key.generated.public_key_openssh"
    ec2_sg = "allow_ssh_stg"
    ssh_port = 22
    tags = {
       "Name" = "Terraform-EC2-Stg"
        "Environment" = "stg"
    
    }
    volume_size = 10
    volume_type = "gp3"
    