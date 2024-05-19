resource "aws_iam_role_policy" "lambda_role_policy" {
  name = "lambda_role_policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "lambda:InvokeFunction",
          "lambda:GetFunction",
          "s3:PutObject",
          "lambda:CreateAlias",
          "lambda:GetAlias",
          "lambda:DeleteAlias"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_role_policy" "s3_role_policy" {
  name = "s3_role_policy"
  role = aws_iam_role.s3_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })

}

resource "aws_iam_role_policy" "cloudwatch_policies" {
  name = "cloudwatch_policies"
  role = aws_iam_role.master_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:DescribeLogGroups",
          "logs:ListTagsLogGroup",
          "logs:DeleteLogGroup"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "dynamodb_policies" {
  name = "dynamodb_policies"
  role = aws_iam_role.master_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "dynamodb:CreateTable",
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "s3:PutObject",
          "dynamodb:DeleteItem",
          "dynamodb:ListTables"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "event_policies" {
  name = "event_policies"
  role = aws_iam_role.master_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "events:DescribeEventBus",
          "events:ListTargetsByRule",
          "events:TagResource",
          "events:PutRule",
          "events:DescribeRule",
          "events:ListTagsForResource",
          "events:PutTargets",
          "events:RemoveTargets",
          "events:DeleteRule"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "s3_policies" {
  name = "s3_policies"
  role = aws_iam_role.master_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:ListAllMyBuckets",
          "s3:CreateBucket",
          "s3:GetBucketPolicy",
          "s3:GetBucketAcl",
          "s3:PutBucketAcl",
          "s3:GetBucketCORS",
          "s3:DeleteBucket",
          "s3:GetBucketWebsite",
          "s3:GetBucketVersioning",
          "s3:GetAccelerateConfiguration",
          "s3:GetBucketRequestPayment",
          "s3:GetBucketLogging",
          "s3:GetLifecycleConfiguration",
          "s3:GetReplicationConfiguration",
          "s3:GetEncryptionConfiguration",
          "s3:GetBucketObjectLockConfiguration",
          "s3:GetBucketTagging",
          "s3:PutBucketVersioning",
          "s3:PutBucketPublicAccessBlock",
          "s3:PutLifecycleConfiguration",
          "s3:GetBucketPublicAccessBlock",
          "s3:PutBucketCORS",
          "s3:PutEncryptionConfiguration",
          "s3:GetObject"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "iam_policies" {
  name = "iam_policies"
  role = aws_iam_role.master_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "iam:GetRole",
          "iam:CreateRole",
          "iam:ListRolePolicies",
          "iam:ListAttachedRolePolicies",
          "iam:PutRolePolicy",
          "iam:GetRolePolicy",
          "iam:DeleteRolePolicy",
          "iam:PassRole",
          "iam:ListInstanceProfilesForRole",
          "iam:DeleteRole",
          "iam:TagRole",
          "iam:ListAttachedUserPolicies",
          "iam:UpdateAssumeRolePolicy"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policies" {
  name = "lambda_policies"
  role = aws_iam_role.master_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "lambda:CreateFunction",
          "lambda:GetFunction",
          "lambda:DeleteFunction",
          "lambda:ListVersionsByFunction",
          "lambda:GetFunctionCodeSigningConfig",
          "lambda:UpdateFunctionCode",
          "lambda:UpdateFunctionConfiguration",
          "lambda:AddPermission",
          "lambda:GetPolicy",
          "lambda:RemovePermission",
          "lambda:PublishVersion",
          "lambda:CreateAlias",
          "lambda:GetAlias",
          "lambda:DeleteAlias"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}