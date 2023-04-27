# AWS

AWS環境を管理している

```
.
├── .github
│   └── workflows
│       └── hello-world.yaml
├── .gitignore
├── README.md
└── terraform
    └── .terraform-version

```

## GitHub Actions で Terraform 実行

自動で `terraform plan` して、承認後に `terraform apply` できるようにしたい。
