#create multiple instance with their username and count
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type = number
  
  
  
  
}
variable "ec2_username" {
  description = "Default SSH username for EC2 instance"
  type = string
 
  
}
variable "key_name" {
    type = string
   
  
}
variable "ec2_sg" {
    type = string
    description = "Security group name"
    
}
variable "ssh_port" {
    type = number
    description = "Allow inbound traffic"
  
}
variable "ami" {
    type = string
    
  
}
variable "instance_type" {
    type = string
    
  
}
variable "tags" {
    type = map(string)
    
    
  
}
variable "volume_size" {
    type = number
    
  
}
variable "volume_type" {
    type = string
   
  
}
variable "environment" {
    type = string
    
    
  
}
variable "user_data" {
    type = string
  
}