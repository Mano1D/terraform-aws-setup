
Terraform AWS Setup  

🚀 Terraform AWS Infrastructure Setup  

📌 Overview  
This project provides Terraform scripts to automate the provisioning of an AWS EC2 instance, generate an SSH key pair, and optionally create an S3 bucket and an IAM user with policy attachments.  

📁 Project Structure  
├── main.tf        Main Terraform configuration file  
├── variables.tf   (Optional) Variables for configuration  
├── outputs.tf     Outputs for Terraform resources  
├── key-gen.pem    SSH private key (generated locally)  
└── README.md      Documentation  

🚀 Features  
✅ Automated EC2 instance deployment using Terraform  
✅ Dynamically generated SSH key pair for secure access  
✅ Automatic upload of SSH public key to AWS as a Key Pair  
✅ Outputs EC2 instance's public IP for easy access  
✅ (Optional) Creates an S3 bucket and an IAM user with policies  

🔧 Prerequisites  
Before deploying this Terraform setup, ensure you have:  
1. AWS CLI installed & configured (aws configure).  
2. Terraform installed (terraform -v to check version).  
3. A GitHub repository to store and manage your Terraform code.  

📌 Deployment Guide  

Step 1: Clone the Repository  
git clone https://github.com/Mano1D/terraform-aws-setup.git  
cd terraform-aws-setup  

Step 2: Initialize Terraform  
terraform init  
This downloads necessary providers and prepares the working directory.  

Step 3: Validate Configuration  
terraform validate  
Ensures that the Terraform syntax and configuration are correct.  

Step 4: Plan Infrastructure Deployment  
terraform plan  
Displays the execution plan before making actual changes.  

Step 5: Apply Terraform Configuration  
terraform apply -auto-approve  
This command provisions the resources defined in main.tf.  

Step 6: Retrieve EC2 Public IP  
terraform output ec2_public_ip  
Outputs the public IP of the created EC2 instance.  

Step 7: Connect to EC2 Instance via SSH  
ssh -i key-gen.pem ubuntu@<EC2_PUBLIC_IP>  
Replace <EC2_PUBLIC_IP> with the actual public IP from the output.  

📤 Version Control & Pushing to GitHub  

Initialize Git and Add Remote Repository  
git init  
git remote add origin https://github.com/Mano1D/terraform-aws-setup.git  

Add .gitignore (To Exclude Sensitive Files)  
Create a .gitignore file and add:  

key-gen.pem  
.terraform/  
terraform.tfstate  
terraform.tfstate.backup  

Commit and Push Changes  
git add .  
git commit -m "Initial commit - Terraform AWS setup"  
git branch -M main  
git push -u origin main  

📌 Destroying the Infrastructure  
To remove all created resources, use:  
terraform destroy -auto-approve  
This will delete the EC2 instance, SSH key pair, and any optional resources.  

📌 Notes  
- Security: Never expose your private key (key-gen.pem). Use .gitignore to exclude it from commits.  
- Customization: Modify the ami and instance_type in main.tf as needed.  
- AWS Billing: Ensure you terminate resources after use to avoid unexpected charges.  

