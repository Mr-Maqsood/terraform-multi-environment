# Generate an RSA private key (similar to ssh-keygen -t rsa -b 4096)
resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS SSH key pair
resource "aws_key_pair" "default" {
  key_name   = "terra-key-${var.environment}"
  public_key = tls_private_key.generated.public_key_openssh
}

# Save private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.generated.private_key_pem
  filename        = "private_key_${var.environment}.pem"
  file_permission = "0600"  # restrict access to the private key
}

# Call ec2 module
module "dev_ec2" {
    source = "../../modules/ec2"
    environment = var.environment
    ami = var.ami
    instance_count = 1
    key_name = "key-name-${var.environment}"
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
    
    
    user_data = file("${path.root}/../../modules/ec2/scripts/install_services.sh")

  
}
