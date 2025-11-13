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