# An IAM group for security_audit users
resource "aws_iam_group" "security_audit_users" {
  name = var.security_audit_users_group_name
}

# Attach standard AWS SecurityAudit policy to the group
resource "aws_iam_group_policy_attachment" "securityaudit_policy_attachment" {
  group      = aws_iam_group.security_audit_users.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

# Attach our SecurityAuditExtras policy to the group
resource "aws_iam_group_policy_attachment" "securityauditextras_policy_attachment" {
  group      = aws_iam_group.security_audit_users.name
  policy_arn = aws_iam_policy.securityauditextras_policy.arn
}
