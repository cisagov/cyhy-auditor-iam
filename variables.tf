# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "auditors" {
  description = "A map containing the usernames of each auditor and a list of audit roles assigned to that user.  The only currently-defined audit role is \"security_audit\".  Example: { \"firstname1.lastname1\" = { \"roles\" = [ \"security_audit\" ] }, \"firstname2.lastname2\" = { \"roles\" = [ \"security_audit\" ] } }."
  nullable    = false
  type        = map(object({ roles = list(string) }))
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region where the non-global resources are to be provisioned (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}

variable "security_audit_users_group_name" {
  default     = "security_auditors"
  description = "The name of the group to be created for security audit users."
  nullable    = false
  type        = string
}

variable "securityauditextras_policy_description" {
  default     = "Allows access to additional resources required by security auditors."
  description = "The description to associate with the IAM policy that gives access to additional permissions required by security auditors."
  nullable    = false
  type        = string
}

variable "securityauditextras_policy_name" {
  default     = "SecurityAuditExtras"
  description = "The name to assign the IAM policy that gives access to additional permissions required by security auditors."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
