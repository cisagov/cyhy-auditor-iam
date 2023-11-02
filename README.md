# cyhy-auditor-iam #

[![GitHub Build Status](https://github.com/cisagov/cyhy-auditor-iam/workflows/build/badge.svg)](https://github.com/cisagov/cyhy-auditor-iam/actions)

This project is used to manage IAM permissions for auditor users.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- User accounts for all auditor users must have been created previously.  We
  recommend using the
  [`cisagov/cyhy-users-non-admin`](https://github.com/cisagov/cyhy-users-non-admin)
  repository to create auditor user accounts.

## Usage ##

1. Create a Terraform workspace (if you haven't already done so) by running
   `terraform workspace new <workspace_name>`
1. Create a `<workspace_name>.tfvars` file with all of the required
  variables (see [Inputs](#inputs) below for details):

  ```hcl
  auditors = {
    "firstname1.lastname1"    = { "roles" = ["security_audit"] },
    "firstname2.lastname2"    = { "roles" = ["security_audit"] },
  }
  ```

1. Run the command `terraform init`.
1. Run the command `terraform apply
  -var-file=<workspace_name>.tfvars`.

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 4.9 |

## Modules ##

No modules.

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_group.security_audit_users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.securityaudit_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_group_policy_attachment.securityauditextras_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.securityauditextras_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user_group_membership.security_audit](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_policy_document.securityauditextras_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_user.auditors](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auditors | A map containing the usernames of each auditor and a list of audit roles assigned to that user.  The only currently-defined audit role is "security\_audit".  Example: { "firstname1.lastname1" = { "roles" = [ "security\_audit" ] }, "firstname2.lastname2" = { "roles" = [ "security\_audit" ] } }. | `map(object({ roles = list(string) }))` | n/a | yes |
| aws\_region | The AWS region where the non-global resources are to be provisioned (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| security\_audit\_users\_group\_name | The name of the group to be created for security audit users. | `string` | `"security_auditors"` | no |
| securityauditextras\_policy\_description | The description to associate with the IAM policy that gives access to additional permissions required by security auditors. | `string` | `"Allows access to additional resources required by security auditors."` | no |
| securityauditextras\_policy\_name | The name to assign the IAM policy that gives access to additional permissions required by security auditors. | `string` | `"SecurityAuditExtras"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| security\_audit\_group | The group of security auditors. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
