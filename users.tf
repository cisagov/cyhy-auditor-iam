# Fetch all users listed in var.auditors
data "aws_iam_user" "auditors" {
  for_each = var.auditors

  user_name = each.key
}
