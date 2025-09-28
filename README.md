# 🚀 Wakapi IaC 
> Available on October 17 (Assignment due date)

As an assignment for the course *Introduction to Cloud Architecture*, this project focuses on the implementation of **Infrastructure as Code (IaC)** and can automatically set up **Wakapi** and deploy it on **Google Cloud Platform** with **Neon (PostgreSQL)** as the database.

Features
- **2 × e2-micro instances** (auto-scales up to 3 instances during heavy traffic)  
- **Neon (PostgreSQL)** as the database  
- **Easy and fast deployment**

### :triangular_ruler: Architecture Diagram

![wakapi-iac](https://github.com/user-attachments/assets/fc92229f-ffa7-4ae3-95bf-511420670195)

## :dart: Before run `terraform apply`

#### Rename the example startup and variables files:

```sh
  mv startup.sh.example startup.sh
  mv variables.tf.example variables.tf
```

#### :memo: Config your GCP project in `variables.tf`.

| Variables          | Type     | Description                   |
| :----------------- | :------- | :---------------------------- |
| `project_id`       | `string` | GCP Project ID.               |
| `region`           | `string` | GCP project region.           |
| `zone`             | `string` | GCP project zone.             |
| `credentials_file` | `string` | Path to credentials file.     |
| `service_account`  | `string` | Google Service Account email. |

#### :wrench: Initialize and Review the Plan

```sh
  terraform init && terraform plan
```

#### 🚀 Deploy to GCP

```sh
  terraform apply
```

#### 🧹 Clean Up Resources

> **DANGER:** This will destroy all resources created by Terraform!

```sh
  terraform destroy
```

<br>
<p align="right">For educational purposes, make with 🤍 by whyzotee.</p>
