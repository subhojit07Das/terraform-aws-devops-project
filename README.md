# Terraform AWS EC2 Web Server (Free Tier)

A beginner‚Äëfriendly **Terraform** project that provisions an **AWS EC2** instance running a simple web server. This project is designed to practice **IaC basics**, **security groups**, **user data**, and the **Terraform workflow**, while staying within the **AWS Free Tier**.

---

## Ì≥å What This Project Does

* Creates an AWS **EC2 instance** (Free Tier eligible)
* Configures a **Security Group** allowing:

  * SSH (22)
  * HTTP (80)
* Uses **user_data** to automatically install and start a web server
* Outputs a **public IP** to access the web page
* Cleanly destroys all resources using Terraform

> ‚ùó This project **does NOT** create:
>
> * Elastic IP
> * Additional EBS volumes

---

## Ì∑± Architecture (Simple)

```
Your Browser
     ‚îÇ
     ‚ñº
Public Internet
     ‚îÇ
     ‚ñº
EC2 Instance (Amazon Linux)
 ‚îú‚îÄ‚îÄ Security Group
 ‚îÇ   ‚îú‚îÄ‚îÄ SSH : 22
 ‚îÇ   ‚îî‚îÄ‚îÄ HTTP: 80
 ‚îî‚îÄ‚îÄ User Data ‚Üí Apache Web Server
```

---

## Ì≥Ç Project Structure

```
terraform-aws-ec2-webserver/
‚îú‚îÄ‚îÄ main.tf          # EC2 + Security Group resources
‚îú‚îÄ‚îÄ provider.tf      # AWS provider configuration
‚îú‚îÄ‚îÄ user_data.sh     # Web server bootstrap script
‚îú‚îÄ‚îÄ terraform.tfstate
‚îî‚îÄ‚îÄ README.md
```

---

## ‚úÖ Prerequisites

Before you begin, make sure you have:

* AWS account (Free Tier)
* IAM user with programmatic access
* AWS CLI configured

  ```bash
  aws configure
  ```
* Terraform installed (v1.x recommended)

  ```bash
  terraform -version
  ```
* An existing **EC2 Key Pair** in AWS

> Ì¥ê If you did **not download the key earlier**, you **cannot SSH** into that instance.
> Solution: destroy and recreate the instance with a new key pair.

---

## ‚öôÔ∏è Configuration Notes

* **Region**: Defined in `provider.tf`
* **Instance Type**: `t2.micro` (Free Tier)
* **AMI**: Amazon Linux 2
* **Key Pair**: Must already exist in AWS
* **HTTP rule** is mandatory for web access

---

## Ì∫Ä How to Deploy

### 1Ô∏è‚É£ Initialize Terraform

```bash
terraform init
```

### 2Ô∏è‚É£ Validate Configuration

```bash
terraform validate
```

### 3Ô∏è‚É£ Preview Resources

```bash
terraform plan
```

### 4Ô∏è‚É£ Create Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

---

## Ìºê Access the Web Server

After apply completes:

1. Copy the **public IP** from the output
2. Open a browser:

   ```
   http://<PUBLIC_IP>
   ```
3. You should see the default Apache test page Ìæâ

---

## Ì∑π Destroy Infrastructure (Important)

To avoid charges:

```bash
terraform destroy
```

Type `yes` to confirm.

---

## Ì∑† Common Issues & Fixes

### ‚ùå HTTP not working

* Security group missing port **80** rule
* Instance created before rule was added

‚úÖ **Fix**: Destroy and recreate resources

---

### ‚ùå Cannot SSH into EC2

* Key file not downloaded
* Wrong key pair used

‚úÖ **Fix**: Create a new key pair and re‚Äëdeploy

---

## Ì≥ò Learning Outcomes

By completing this project, you will understand:

* Terraform workflow (init ‚Üí plan ‚Üí apply ‚Üí destroy)
* AWS EC2 basics
* Security Group rules
* User data automation
* Free Tier best practices

---

## Ì¥Æ Next Improvements (Optional)

* Add variables (`variables.tf`)
* Use outputs (`outputs.tf`)
* Add remote backend (S3)
* Create ALB (later, non‚Äëfree tier)
* CI/CD with GitHub Actions

---

## Ì±®‚ÄçÌ≤ª Author

**Subhojit Das**
Junior DevOps | RHCSA | CKA

---

‚≠ê If you found this helpful, consider starring the repo!

