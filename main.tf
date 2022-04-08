resource "aws_iam_role" "example_resource" {
  name               = var.name // <= You may need to append to the name string in a name field to avoid conflicts
  assume_role_policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
   ]
}
EOF

  tags = local.tags // <= Note the use of local.tags
}