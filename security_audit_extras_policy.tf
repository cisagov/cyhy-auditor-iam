# ------------------------------------------------------------------------------
# Create the IAM policy with additional permissions needed by security
# auditors beyond the standard AWS-defined SecurityAudit policy.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "securityauditextras_doc" {
  statement {
    actions = [
      "logs:GetLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:log-group:*:log-stream:*",
    ]
  }

  statement {
    actions = [
      "logs:FilterLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:log-group:*",
    ]
  }
}

resource "aws_iam_policy" "securityauditextras_policy" {
  description = var.securityauditextras_policy_description
  name        = var.securityauditextras_policy_name
  policy      = data.aws_iam_policy_document.securityauditextras_doc.json
}
