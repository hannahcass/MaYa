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