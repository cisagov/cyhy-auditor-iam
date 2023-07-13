# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "auditors" {
  type        = map(object({ roles = list(string) }))
  description = "A map containing the usernames of each auditor and a list of audit roles assigned to that user.  The only currently-defined audit role is \"security_audit\".  Example: { \"firstname1.lastname1\" = { \"roles\" = [ \"security_audit\" ] }, \"firstname2.lastname2\" = { \"roles\" = [ \"security_audit\" ] } }."
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "security_audit_users_group_name" {
  type        = string
  description = "The name of the group to be created for security audit users."
  default     = "security_auditors"
}

variable "securityauditextras_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that gives access to additional permissions required by security auditors."
  default     = "Allows access to additional resources required by security auditors."
}

variable "securityauditextras_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that gives access to additional permissions required by security auditors."
  default     = "SecurityAuditExtras"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
