# Terraform AWS DevOps Project 🚀

This repository contains a **beginner-friendly DevOps project** that demonstrates how to provision AWS infrastructure using **Terraform**, serve a static website on **EC2 with Nginx**, and validate the infrastructure using **GitHub Actions (CI)**.

This project is intentionally designed for **new DevOps engineers** to understand *how things work*, not just *what commands to run*.

---

## 📌 Project Overview

**Goal:**

* Provision an AWS EC2 instance using Terraform
* Configure security groups (SSH + HTTP)
* Install and run Nginx using `user_data`
* Serve a simple portfolio-style webpage
* Add CI checks using GitHub Actions

**What this project is NOT:**

* Fully automated production deployment
* Advanced CI/CD with auto-apply (yet)

---

## 🛠 Tools & Technologies Used

| Tool            | Purpose                |
| --------------- | ---------------------- |
| AWS             | Cloud provider         |
| Terraform       | Infrastructure as Code |
| EC2             | Compute instance       |
| Security Groups | Network access control |
| Nginx           | Web server             |
| Git & GitHub    | Version control        |
| GitHub Actions  | CI for Terraform       |

---

## 📂 Project Structure

```
terraform-aws-devops-project/
│
├── .github/
│   └── workflows/
│       └── terraform-ci.yml   # CI pipeline for Terraform
│
├── scripts/
│   └── user_data.sh           # EC2 bootstrap script
│
├── terraform/
│   ├── main.tf                # Security group & core resources
│   ├── ec2.tf                 # EC2 instance definition
│   ├── provider.tf            # AWS provider config
│   ├── variable.tf            # Input variables
│   ├── terraform.tfvars       # Local-only variable values (ignored by git)
│   ├── output.tf              # Outputs (public IP, etc.)
│   └── .terraform.lock.hcl    # Provider lock file
│
├── .gitignore
├── README.md
```

---

## 🔐 Security & Best Practices

### Why `terraform.tfvars` is ignored

This file contains **sensitive or environment-specific data**, such as:

* EC2 key pair name
* Instance type overrides

➡️ In real-world DevOps projects:

* Secrets are **never committed to GitHub**
* Each environment (local, CI, prod) injects values differently

Your `.gitignore` correctly includes:

```
*.tfvars
```

---

## ⚙️ Terraform Configuration Explained

### Provider (`provider.tf`)

Defines:

* AWS as the provider
* Region configuration

Credentials are **NOT hardcoded**.
Terraform expects AWS credentials via:

* `~/.aws/credentials` (local)
* GitHub Secrets (CI)

---

### Variables (`variable.tf`)

Used to avoid hardcoding values:

* `instance_type`
* `key_name`
* `project_name`

This makes the project:

* Reusable
* Safer
* Easier to maintain

---

### EC2 & Security Group (`main.tf`, `ec2.tf`)

* Security group allows:

  * SSH (22)
  * HTTP (80)
* EC2 instance uses:

  * Amazon Linux AMI
  * Nginx installed via `user_data`

---

### User Data Script (`scripts/user_data.sh`)

This script runs **automatically when EC2 boots**:

* Updates system packages
* Installs Nginx
* Starts the web server
* Deploys a simple HTML page

This mimics **real cloud-init usage in production**.

---

## 🔄 CI with GitHub Actions

### What the CI pipeline does

On every `push` or `pull request` to `main`:

1. Checks out the repo
2. Installs Terraform
3. Runs:

   * `terraform init`
   * `terraform fmt -check`
   * `terraform validate`
   * `terraform plan`

### Why apply is NOT included

Auto-apply is intentionally skipped because:

* It requires AWS credentials
* It needs environment approval
* This is safer for beginners

This mirrors **real-world CI practices**.

---

## ❗ Common Issues You Faced (And Why They Matter)

### `terraform destroy` not working after git clone

Reason:

* Terraform state (`.tfstate`) is local
* You deleted it when the directory was removed

➡️ In production, state is stored remotely (S3 + DynamoDB).

---

### GitHub Actions stuck on variables

Reason:

* CI cannot prompt for input
* Variables like `key_name` must be injected

Solution (future):

* Use GitHub Secrets
* Use `-var` flags or env vars

---

### AWS credentials error in CI

Reason:

* No credentials available inside GitHub runner

Correct approach:

* Use IAM user with limited permissions
* Store credentials in GitHub Secrets

---

## 🧠 What You Have Learned So Far

✔ Real Terraform project structure
✔ How EC2 is provisioned via IaC
✔ Why CI pipelines fail without secrets
✔ How DevOps handles security
✔ Why errors are part of learning

---

## 🛣️ Next Steps (When You Resume)

* Add remote Terraform state (S3)
* Inject AWS credentials via GitHub Secrets
* Enable controlled `terraform apply`
* Improve the portfolio website

---

## 🙌 Final Note

This project is **not rushed DevOps**.
It is **correct DevOps**.

If you understand *why* something failed, you are learning faster than most beginners.

Happy learning 🚀
