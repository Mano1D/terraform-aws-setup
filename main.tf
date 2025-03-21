provider "aws" {
  region = "us-east-1"
}

# Generate a new SSH private key
resource "tls_private_key" "my_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.my_ssh_key.private_key_pem
  filename        = "${path.module}/key-gen.pem"
  file_permission = "0600"
}

# Upload the generated public key to AWS as a Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "key-gen-new"
  public_key = tls_private_key.my_ssh_key.public_key_openssh
}

# Create an EC2 instance using the generated key
resource "aws_instance" "tera" {
  ami           = "ami-04b4f1a9cf54c11d0" # Your provided AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name # Attach the generated key

  tags = {
    Name = "Tera-Insta"
  }

  # Connection block for SSH access (optional)
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = tls_private_key.my_ssh_key.private_key_pem
    host        = self.public_ip
  }
}

# Output the instance public IP for easy access
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.tera.public_ip
}
