<!-- BEGIN_TF_DOCS -->
# Access package in Identity Governance

## Required Permissions

* `EntitlementManagement.ReadWrite.All` - Access catalogs and packages

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (~> 3.0)

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.2)

## Resources

The following resources are used by this module:

- [azuread_access_package.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package) (resource)
- [azuread_access_package_assignment_policy.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_assignment_policy) (resource)
- [msgraph_resource.primary_approvers](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/resource) (resource)
- [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_backup_approvers_group_object_id"></a> [backup\_approvers\_group\_object\_id](#input\_backup\_approvers\_group\_object\_id)

Description: n/a

Type: `string`

### <a name="input_catalog_id"></a> [catalog\_id](#input\_catalog\_id)

Description: n/a

Type: `string`

### <a name="input_description"></a> [description](#input\_description)

Description: n/a

Type: `string`

### <a name="input_display_name"></a> [display\_name](#input\_display\_name)

Description: n/a

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_access_package_id"></a> [access\_package\_id](#output\_access\_package\_id)

Description: The access package ID

### <a name="output_primary_approvers_group_id"></a> [primary\_approvers\_group\_id](#output\_primary\_approvers\_group\_id)

Description: The Entra ID group created to hold the primary approvers for this access package

## Modules

No modules.
<!-- END_TF_DOCS -->