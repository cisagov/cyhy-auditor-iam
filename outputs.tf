output "security_audit_group" {
  value       = aws_iam_group.security_audit_users
  description = "The group of security auditors."
}
