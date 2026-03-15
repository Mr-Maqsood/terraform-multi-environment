#Generated an RSA private key (like ssh-keygen -t rsa -b 4096)
resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Create SSH key pair
resource "aws_key_pair" "default" {
  key_name   = var.key_name
  public_key = tls_private_key.generated.public_key_openssh
}
#Save private key locally 

resource "local_file" "private_key" {
 content = tls_private_key.generated.private_key_pem
 filename = "private_key_${var.environment}.pem"
 file_permission = "400" # restrict access to the private key

}
# Call ec2 module
module "dev_ec2" {
    source = "../../modules/ec2"
    environment = var.environment
    ami = var.ami
    instance_count = 1
    key_name = "stging-key-${var.environment}"
    instance_type = var.instance_type
    ec2_username = var.ec2_username

    ec2_sg = var.ec2_sg
    ssh_port = var.ssh_port
    tags = {
         Name = var.tags["Name"]
         Environment = var.environment
    }
  
    volume_size = 20
    volume_type = var.volume_type
  
    

  
}

# Call ec2 module
module "frontend_ec2" {
    source = "../../modules/ec2"
    environment = var.environment
    ami = var.ami
    instance_count = 1
    key_name = "frontend${var.environment}"
    instance_type = var.instance_type
    ec2_username = var.ec2_username

    ec2_sg = "var.frontend-${var.environment}"
    ssh_port = var.ssh_port
    tags = {
         Name = "Frontend-${var.environment}"
         Environment = var.environment
    }
  
    volume_size = var.volume_size
    volume_type = var.volume_type
  
    

  
}

# Call ec2 module
module "backend_ec2" {
    source = "../../modules/ec2"
    environment = var.environment
    ami = var.ami
    instance_count = 1
    key_name = "backend-${var.environment}"
    instance_type = var.instance_type
    ec2_username = var.ec2_username

    ec2_sg = "var.backend-${var.environment}"
    ssh_port = var.ssh_port
    tags = {
         Name = "Backend-${var.environment}"
         Environment = var.environment
    }
  
    volume_size = var.volume_size
    volume_type = var.volume_type
  
    

  
}

# Call ec2 module
module "database_ec2" {
    source = "../../modules/ec2"
    environment = var.environment
    ami = var.ami
    instance_count = 2
    key_name = "database-${var.environment}"
    instance_type = var.instance_type
    ec2_username = var.ec2_username

    ec2_sg = "var.databse-${var.environment}"
    ssh_port = var.ssh_port
    tags = {
         Name = "Database-${var.environment}"
         Environment = var.environment
    }
  
    volume_size = 15
    volume_type = var.volume_type
  
    

  
}