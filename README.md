# AWS

AWS環境を管理している

```
.
├── .github
│   └── workflows
│       └── hello-world.yaml  # 初期テスト用
├── .gitignore
├── README.md
├── docs
│   └── setup.md
└── terraform
    ├── .terraform-version
    ├── provider.tf
    └── s3.tf


```

## GitHub Actions で Terraform 実行

自動で `terraform plan` して、承認後に `terraform apply` できるようにしたい。
