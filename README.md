<!-- BEGIN_TF_DOCS -->
# Identity Governance in Entra ID

Demo-session for [Ignite 2025 Watch Party](https://www.meetup.com/azure-user-group-norway/events/311686748/) hosted by [Azure User Group Norway](https://www.meetup.com/azure-user-group-norway/)

## Required Permissions

The managed identity/service principal used to deploy the demo require the following API permissions in MSGraph:

* `CrossTenantInformation.ReadBasic.All` - Look up external tenant id
* `Group.ReadWrite.All` - Create the group assigned to the Catalog owner role
* `EntitlementManagement.ReadWrite.All` - Access catalogs and packages, create connected organization
* `RoleManagement.ReadWrite.Directory` - Read role templates and create groups with `assignable to role = true`
* `RoleManagementPolicy.ReadWrite.Directory` - Modify role settings
* `User.read.All` - Get the demo admin user

> [!NOTE]
> Remember to select `type=application` for permissions, and grant admin consent

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (~> 3.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

- <a name="requirement_msgraph"></a> [msgraph](#requirement\_msgraph) (~> 0.2)

## Resources

The following resources are used by this module:

- [azuread_user.tjs](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_demo_admin_user_upn"></a> [demo\_admin\_user\_upn](#input\_demo\_admin\_user\_upn)

Description: n/a

Type: `string`

### <a name="input_external_tenant_domain_name"></a> [external\_tenant\_domain\_name](#input\_external\_tenant\_domain\_name)

Description: n/a

Type: `string`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: n/a

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.

## Modules

The following Modules are called:

### <a name="module_connected_organization"></a> [connected\_organization](#module\_connected\_organization)

Source: ./modules/connected-organization

Version:
<!-- END_TF_DOCS -->