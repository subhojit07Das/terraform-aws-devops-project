# Terraform AWS EC2 Web Server (Free Tier)

A beginner‑friendly **Terraform** project that provisions an **AWS EC2** instance running a simple web server. This project is designed to practice **IaC basics**, **security groups**, **user data**, and the **Terraform workflow**, while staying within the **AWS Free Tier**.

---

## 📌 What This Project Does

* Creates an AWS **EC2 instance** (Free Tier eligible)
* Configures a **Security Group** allowing:

  * SSH (22)
  * HTTP (80)
* Uses **user_data** to automatically install and start a web server
* Outputs a **public IP** to access the web page
* Cleanly destroys all resources using Terraform

> ❗ This project **does NOT** create:
>
> * Elastic IP
> * Additional EBS volumes

---

## 🧱 Architecture (Simple)

```
Your Browser
     │
     ▼
Public Internet
     │
     ▼
EC2 Instance (Amazon Linux)
 ├── Security Group
 │   ├── SSH : 22
 │   └── HTTP: 80
 └── User Data → Apache Web Server
```

---

## 📂 Project Structure

```
terraform-aws-ec2-webserver/
├── main.tf          # EC2 + Security Group resources
├── provider.tf      # AWS provider configuration
├── user_data.sh     # Web server bootstrap script
├── terraform.tfstate
└── README.md
```

---

## ✅ Prerequisites

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

> 🔐 If you did **not download the key earlier**, you **cannot SSH** into that instance.
> Solution: destroy and recreate the instance with a new key pair.

---

## ⚙️ Configuration Notes

* **Region**: Defined in `provider.tf`
* **Instance Type**: `t2.micro` (Free Tier)
* **AMI**: Amazon Linux 2
* **Key Pair**: Must already exist in AWS
* **HTTP rule** is mandatory for web access

---

## 🚀 How to Deploy

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Validate Configuration

```bash
terraform validate
```

### 3️⃣ Preview Resources

```bash
terraform plan
```

### 4️⃣ Create Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🌐 Access the Web Server

After apply completes:

1. Copy the **public IP** from the output
2. Open a browser:

   ```
   http://<PUBLIC_IP>
   ```
3. You should see the default Apache test page 🎉

---

## 🧹 Destroy Infrastructure (Important)

To avoid charges:

```bash
terraform destroy
```

Type `yes` to confirm.

---

## 🧠 Common Issues & Fixes

### ❌ HTTP not working

* Security group missing port **80** rule
* Instance created before rule was added

✅ **Fix**: Destroy and recreate resources

---

### ❌ Cannot SSH into EC2

* Key file not downloaded
* Wrong key pair used

✅ **Fix**: Create a new key pair and re‑deploy

---

## 📘 Learning Outcomes

By completing this project, you will understand:

* Terraform workflow (init → plan → apply → destroy)
* AWS EC2 basics
* Security Group rules
* User data automation
* Free Tier best practices

---

## 🔮 Next Improvements (Optional)

* Add variables (`variables.tf`)
* Use outputs (`outputs.tf`)
* Add remote backend (S3)
* Create ALB (later, non‑free tier)
* CI/CD with GitHub Actions

---

## 👨‍💻 Author

**Subhojit Das**
Junior DevOps | RHCSA | CKA

---

⭐ If you found this helpful, consider starring the repo!
