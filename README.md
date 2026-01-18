# AWS Terraform DevOps Project

## Overview
This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS resources under the Free Tier.

## Tech Stack
- AWS (EC2, EBS, Elastic IP, Security Groups)
- Terraform
- GitHub Actions (CI/CD)
- RHEL 10 (Local VM)
- Linux & Shell Scripting

## Architecture
- EC2 instance with Elastic IP
- Security Group allowing SSH & HTTP
- Additional EBS volume attached to EC2
- Automated provisioning via Terraform

## Usage
```bash
terraform init
terraform plan
terraform apply
