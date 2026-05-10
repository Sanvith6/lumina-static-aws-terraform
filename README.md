# ☁️ Lumina-Static: Enterprise Global Hosting Solution

[![Security Scan](https://github.com/saishalini08/static-website-example-project1/actions/workflows/security-scan.yml/badge.svg)](https://github.com/saishalini08/static-website-example-project1/actions/workflows/security-scan.yml)
[![Infrastructure: Terraform](https://img.shields.io/badge/Infrastructure-Terraform-623CE4?logo=terraform)](https://www.terraform.io/)
[![Cloud: AWS](https://img.shields.io/badge/Cloud-AWS-232F3E?logo=amazon-aws)](https://aws.amazon.com/)

**Lumina-Static** is a production-grade, high-performance static website hosting platform built on AWS. This project demonstrates senior-level DevOps practices, including Infrastructure as Code (IaC), Edge Security, and automated Observability.

🚀 **Live Demo**: [https://d18euw11hmr3sa.cloudfront.net](https://d18euw11hmr3sa.cloudfront.net)

---

## 📋 Project 1: Requirement Checklist (Mapping)
This repository fulfills 100% of the criteria for the **Static Website Deployment** project:

- [x] **Application**: High-end Portfolio landing page with glassmorphism design.
- [x] **Version Control**: Git initialized and pushed to GitHub.
- [x] **S3**: Private bucket with versioning, encryption, and access logging enabled.
- [x] **CloudFront**: Global CDN distribution with Origin Access Control (OAC).
- [x] **Terraform**: 100% automated provisioning via modularized TF scripts.
- [x] **Monitoring**: Integrated CloudWatch Dashboard and 5xx Error Alarms.

---

## 🏗️ Architecture
The infrastructure is designed for zero-public access, ensuring that assets are only reachable through the CloudFront edge network.

- **Storage**: AWS S3 (Encrypted at rest).
- **CDN**: AWS CloudFront (OAC enabled, legacy OAI avoided).
- **Security**: AWS WAF v2 with Managed Rule Sets (SQLi, XSS protection).
- **DNS/SSL**: Managed by CloudFront with native HSTS and security headers.
- **Monitoring**: CloudWatch Metrics & Alarms.

---

## 🛠️ Tech Stack
- **IaC**: Terraform (v1.5.0+)
- **Cloud**: AWS (S3, CloudFront, WAF, CloudWatch)
- **Frontend**: Semantic HTML5, Vanilla CSS3 (Modern Glassmorphism)
- **Local Dev**: Docker & Docker Compose (Nginx-based preview)

---

## 🚀 Getting Started

### Local Development
To preview the site locally:
```bash
docker-compose up --build
```
Access the site at `http://localhost:8080`.

### Infrastructure Deployment
1. **Configure AWS CLI**:
   ```bash
   aws configure
   ```
2. **Deploy with Terraform**:
   ```bash
   cd infra
   terraform init
   terraform apply
   ```
3. **Sync Assets**:
   ```bash
   aws s3 sync ./app s3://<YOUR_BUCKET_NAME> --delete
   ```

---

## 🛡️ Security Best Practices Applied
- **Least Privilege**: IAM policies scoped strictly to CloudFront OAC.
- **Edge Protection**: WAF prevents common exploits before they reach the origin.
- **Privacy**: S3 public access is 100% blocked; the bucket has no public URL.
- **Data Integrity**: S3 Versioning enabled to prevent accidental deletion.

---
*Built with ❤️ for Cloud Excellence.*
