# AWS

AWS環境を管理している

```
.
├── .github
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows
│       └── terraform-plan-apply.yaml
├── .gitignore
├── README.md
├── docs
│   ├── gha_aws_link.md
│   ├── images
│   │   └── github_actions_approve.png
│   └── setup.md
└── terraform
    ├── .terraform-version
    ├── .terraform.lock.hcl
    ├── ec2.tf
    └── provider.tf
    └── vpc.tf

```

## GitHub Actions で Terraform 実行

1. `git push` すると、`terraform plan` が実行される
2. GitHub > Actions の Review deployments で approve すると`terraform apply` が実行される

![github_actions_approve](/docs/images/github_actions_approve.png)
