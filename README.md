# AWS

AWS環境を管理している

```
.
├── .github
│   └── workflows
│       └── preview-deploy.yaml
├── .gitignore
├── README.md
├── docs
│   ├── gha-aws-link.md
│   └── setup.md
└── terraform
    ├── .terraform-version
    ├── .terraform.lock.hcl
    ├── ec2.tf
    └── s3.tf

```

## GitHub Actions で Terraform 実行

自動で `terraform plan` して、承認後に `terraform apply` できるようにしたい。
