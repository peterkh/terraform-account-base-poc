// Create these IAM roles in every account

resource "aws_iam_role" "cgws_readonly" {
  name = "CGWSReadOnly"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::737061601352:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cgws_readonly" {
  role       = aws_iam_role.cgws_readonly.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
