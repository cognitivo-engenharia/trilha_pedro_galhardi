resource "aws_iam_user" "the-accounts" {

  for_each =  toset(["Todd","James", "Alice", "Bob"])

  name = each.key
  
}