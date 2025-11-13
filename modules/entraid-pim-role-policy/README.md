<!-- BEGIN_TF_DOCS -->
# Assignment policy rules for Entra ID role

configure role settings for an Entra ID role for Privileged Identity Management

## Required Permissions

* `RoleManagement.Read.Directory`
* `RoleManagementPolicy.ReadWrite.Directory`

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.2)

## Resources

The following resources are used by this module:

- [msgraph_update_resource.policy_rules](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/update_resource) (resource)
- [msgraph_resource.role](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/data-sources/resource) (data source)
- [msgraph_resource.role_assignment_policy](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/data-sources/resource) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_role_name"></a> [role\_name](#input\_role\_name)

Description: The Entra ID role to modify the assignment policy for

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_user_activation_max_duration"></a> [user\_activation\_max\_duration](#input\_user\_activation\_max\_duration)

Description: The maximum duration a user can activate the role for. e.g. PT8H for 8 hours

Type: `string`

Default: `"PT8H"`

## Outputs

The following outputs are exported:

### <a name="output_id"></a> [id](#output\_id)

Description: n/a

## Modules

No modules.
<!-- END_TF_DOCS -->