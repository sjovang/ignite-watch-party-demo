<!-- BEGIN_TF_DOCS -->
# Access catalog in Identity Governance

## Required Permissions

* `Group.ReadWrite.All`
* `EntitlementManagement.ReadWrite.All`

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (~> 3.0)

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.2)

## Resources

The following resources are used by this module:

- [azuread_access_package_catalog.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_catalog) (resource)
- [azuread_access_package_catalog_role_assignment.catalog_owner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_catalog_role_assignment) (resource)
- [msgraph_resource.backup_approvers](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/resource) (resource)
- [azuread_access_package_catalog_role.catalog_owner](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/access_package_catalog_role) (data source)
- [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_catalog_owner_id"></a> [catalog\_owner\_id](#input\_catalog\_owner\_id)

Description: n/a

Type: `string`

### <a name="input_description"></a> [description](#input\_description)

Description: n/a

Type: `string`

### <a name="input_name"></a> [name](#input\_name)

Description: n/a

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_external_catalog"></a> [external\_catalog](#input\_external\_catalog)

Description: n/a

Type: `bool`

Default: `false`

## Outputs

The following outputs are exported:

### <a name="output_backup_approvers_group_object_id"></a> [backup\_approvers\_group\_object\_id](#output\_backup\_approvers\_group\_object\_id)

Description: n/a

### <a name="output_catalog_id"></a> [catalog\_id](#output\_catalog\_id)

Description: n/a

## Modules

No modules.
<!-- END_TF_DOCS -->