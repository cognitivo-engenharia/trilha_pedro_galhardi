resource "aws_iam_role" "ec2_role" {
  name = "ec2_s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

resource "aws_iam_policy" "s3_policy" {
  name        = "s3_access_policy"
  description = "Policy to allow S3 access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "s3:*"
      Effect = "Allow"
      Resource = [
        "arn:aws:s3:::primarily-solely-constantly-massive-amoeba-dev",
        "arn:aws:s3:::primarily-solely-constantly-massive-amoeba-dev/*"
      ]
    }]
  })
}
