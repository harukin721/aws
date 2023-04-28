# セットアップ

## Cloud9

```
# version1
$ aws --version

# version1 アンインストール
$ sudo yum -y remove awscli

# version2 インストール
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
$ unzip awscliv2.zip
$ sudo ./aws/install
$ exec -l $SHELL

# version2 確認
$ aws --version

# terraform ユーザーのクレデンシャル
$ export AWS_ACCESS_KEY_ID=< AWS_ACCESS_KEY_ID >
$ export AWS_SECRET_ACCESS_KEY=< AWS_SECRET_ACCESS_KEY >
$ export AWS_DEFAULT_REGION=ap-northeast-1

# 確認
$ aws sts get-caller-identity --query Account --output text
< AWSアカウントID >
$ aws sts get-caller-identity
{
    "UserId": "< AWSユーザーID >",
    "Account": "< AWSアカウントID >",
    "Arn": "arn:aws:iam::< AWSアカウントID >:user/terraform"
}
```

Cloud9 のターミナルからファイルを開けるようにする

```
$ npm install -g c9
$ c9 < ファイル名 >
```

## Terraform

Amazon Linux2 の Cloud9 は Terraform が入っているが、tfenv で管理するようにする

```
# tfenv インストール
$ git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
$ echo $SHELL
/bin/bash
$ echo 'export PATH="HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
$ sudo ln -s ~/.tfenv/bin/* /usr/local/bin/
$ source ~/.bash_profile

# Terraform インストール
$ tfenv install 1.3.0
$ tfenv use 1.3.0
$ terraform -v
Terraform v1.3.0
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.4.6. You can update by downloading from https://www.terraform.io/downloads.html
```

## S3バケット

tfstate を準備する

```
$ aws s3api create-bucket --bucket ${harukin721-aws-tfstate} --create-bucket-configuration LocationConstraint=ap-northeast-1
{
    "Location": "http://harukin721-aws-tfstate.amazonaws.com/"
}
```
