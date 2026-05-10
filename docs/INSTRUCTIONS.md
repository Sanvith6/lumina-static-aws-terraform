# 📖 Deployment Instructions: Lumina-Static

Follow these steps to deploy your professional static website to AWS.

## 1. Local Preview
Before deploying, preview your site locally using Docker:
```bash
docker-compose up --build
```
Access the site at `http://localhost:8080`.

## 2. Infrastructure Deployment
Navigate to the `infra` directory and use Terraform to provision AWS resources.

### Prerequisites
- AWS CLI configured with appropriate credentials.
- Terraform installed (v1.5.0+).

### Steps
1. **Initialize Terraform**:
   ```bash
   cd infra
   terraform init
   ```
2. **Review the Plan**:
   ```bash
   terraform plan
   ```
3. **Apply the Changes**:
   ```bash
   terraform apply
   ```
   *Note: This will output your `cloudfront_domain_name` and `s3_bucket_name`.*

## 3. Upload Website Files
Once the infrastructure is ready, upload your HTML/CSS files to the S3 bucket.

```bash
aws s3 sync ../app s3://<YOUR_BUCKET_NAME> --delete
```
*(Replace `<YOUR_BUCKET_NAME>` with the output from the terraform apply step).*

## 4. Verification
1. Access your website via the `cloudfront_domain_name` (e.g., `https://d123456789.cloudfront.net`).
2. Verify the **CloudWatch Dashboard** in the AWS Console under the name `lumina-static-dashboard`.
3. Check **S3 Access Logs** in the `-logs` bucket after some traffic has been generated.

## 5. Submission
- **GitHub Repository**: [Your Repo Link]
- **Website URL**: Your CloudFront URL
- **Screenshots**: Take screenshots of:
  - Your live website.
  - The AWS S3 bucket console.
  - The CloudFront distribution console.
  - The CloudWatch dashboard.
