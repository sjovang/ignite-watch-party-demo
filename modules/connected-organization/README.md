<!-- BEGIN_TF_DOCS -->
# Connected organization

Configures an external Entra ID tenant as connected organization to be used for scoping access packages to guest accounts from only allowed tenants

## Required Permissions

* `CrossTenantInformation.ReadBasic.All`
* `EntitlementManagement.ReadWrite.All`

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.2)

## Resources

The following resources are used by this module:

- [msgraph_resource.connected_organization](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/resources/resource) (resource)
- [msgraph_resource.external_tenant_id](https://registry.terraform.io/providers/microsoft/msgraph/latest/docs/data-sources/resource) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_connected_tenant_domain_name"></a> [connected\_tenant\_domain\_name](#input\_connected\_tenant\_domain\_name)

Description: The domain name of the connected organization tenant. e.g. contoso.onmicrosoft.com

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.

## Modules

No modules.
<!-- END_TF_DOCS -->