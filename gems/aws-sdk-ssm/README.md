

- https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/sysman-paramstore-cli.html

- パラメータストア を使用して文字列パラメータを作成するには
```
aws ssm put-parameter --name "a_name" --value "a value" --type String

aws ssm put-parameter --name "/Test/IAD/helloWorld" --value "My1stParameter" --type String

aws ssm describe-parameters --filters "Key=Name,Values=/Test/IAD/helloWorld"

{
    "Parameters": [
        {
            "LastModifiedUser": "arn:aws:iam::123456789:user/User's name",
            "LastModifiedDate": 1494529763.156,
            "Type": "String",
            "Name": "helloworld"
        }
    ]
}

aws ssm put-parameter --name "/Test/IAD/helloWorld" --value "good day sunshine" --type String --overwrite

aws ssm get-parameters --names "/Test/IAD/helloWorld"

{
    "InvalidParameters": [],
    "Parameters": [
        {
            "Type": "String",
            "Name": "/Test/IAD/helloWorld",
            "Value": "good day sunshine"
        }
    ]
}

aws ssm get-parameter-history --name "/Test/IAD/helloWorld"
```

- AWS CLI を使用して Secure String パラメータを作成するには

```
# デフォルトの KMS キーを使用する Secure String パラメータを作成する
aws ssm put-parameter --name "a_name" --value "a value, for example P@ssW%rd#1" --type "SecureString"

# カスタム AWS KMS キーを使用する Secure String パラメータを作成する
aws ssm put-parameter --name "a_name" --value "a value" --type "SecureString" --key-id "your AWS user account ID/the custom AWS KMS key"

# カスタム AWS KMS キーを使用する例を次に示します。
aws ssm put-parameter --name "db-password" --value "P@ssW%rd#1" --type "SecureString" --key-id "arn:aws:kms:us-east-1:123456789012:key/1a2b3c4d-1a2b-1a2b-1a2b-1a2b3c4d5e"

aws ssm describe-parameters --filters "Key=Name,Values=the name that you specified"

aws ssm put-parameter --name "the name that you specified" --value "new value" --type "SecureString" --overwrite

aws ssm put-parameter --name "the name that you specified" --value "new value" --type "SecureString" --key-id "the AWS KMS key ID" --overwrite

aws ssm put-parameter --name "the name that you specified" --value "new value" --type "SecureString" --key-id "your AWS user account alias/the custom KMS key" --overwrite

aws ssm get-parameters --names "the name that you specified" --with-decryption

aws ssm get-parameter-history --name "the name that you specified"
```

