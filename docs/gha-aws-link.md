# GHA と AWS の連携

GitHub にクレデンシャルを保存したくないのでIDプロバイダーとIAMロールを利用

## IDプロバイダー作成

IAM > IDプロバイダ

- プロバイダタイプ : OpenID Connect
- プロバイダURL : https://token.actions.githubusercontent.com
- 対象者(Audience) : sts.amazonaws.com

## IAMロール(github-actions-role という名前にした)

IAM > ロールを作成 > ウェブアイデンティティ

- アイデンティティプロバイダー : token.actions.githubusercontent.com (サジェストされる)
- Audience : sts.amazonaws.com (サジェストされる)
- 許可ポリシー : AdministratorAccess (本来は操作対象の設定にあわせて絞るべき)
- 信頼されたエンティティ (subでアクセス元を指定) :

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::< アカウントID >:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
                    "token.actions.githubusercontent.com:sub": "repo:harukin721/aws:*"
                }
            }
        }
    ]
}
```

## terraform init に必要なクレデンシャルを準備

- GitHubのシークレット(AWS_IAM_ROLE_ARN)に IAMロール(github-actions-role)のARNを追加
- AWSのクレデンシャル. https://github.com/marketplace/actions/configure-aws-credentials-for-github-actions
