<!-- BEGIN_TF_DOCS -->
# Associate Entra ID group with access catalog and package

Associate a group in Entra ID with an access catalog and access package.

> [!NOTE]
> Only `Member` and `Owner` are supported. `Eligible Member` and `Eligible Owner` are not yet supported in the terraform provider

## Required Permissions

* `EntitlementManagement.ReadWrite.All`

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (~> 3.0)

## Resources

The following resources are used by this module:

- [azuread_access_package_resource_catalog_association.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_resource_catalog_association) (resource)
- [azuread_access_package_resource_package_association.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/access_package_resource_package_association) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_access_package_id"></a> [access\_package\_id](#input\_access\_package\_id)

Description: n/a

Type: `string`

### <a name="input_catalog_id"></a> [catalog\_id](#input\_catalog\_id)

Description: n/a

Type: `string`

### <a name="input_group_object_id"></a> [group\_object\_id](#input\_group\_object\_id)

Description: n/a

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_access_type"></a> [access\_type](#input\_access\_type)

Description: n/a

Type: `string`

Default: `"Member"`

## Outputs

No outputs.

## Modules

No modules.
<!-- END_TF_DOCS -->