#Configuration Files

1. Define Variables

Create a variables.tf file to define the necessary variables

2. Set Up Networking Components

Create a networking.tf file to define the VPC, subnet, internet gateway, and security group

3. Provision Backend Servers

Create a backend_servers.tf file to define the backend servers

4. Provision Frontend Servers

Create a frontend_servers.tf file to define the frontend servers

5. Set Up S3 Bucket

Create an s3_bucket.tf file to define the S3 bucket

6. Create IAM User

Create an iam_user.tf file to define the IAM user

7. Set Credential Detail (in powershell)
 
7b. Initialize a terraform configurations

    terraform init
    terraform plan
    terraform apply

8. Initialize Git and Push to Git

(create repo in gitHub etc.) - Initialize a Git repository and push your Terraform configurations

    git init
    git add .
    git commit -m "Initial commit"
    git remote add origin <remote_repository_url>
    git push -u origin master

