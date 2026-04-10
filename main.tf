/* get user object for the demo admin user that will be owner of stuff */
data "azuread_user" "tjs" {
  user_principal_name = var.demo_admin_user_upn
}

/* Setup connected organization to scope access to only approved organizations */
module "connected_organization" {
  source                       = "./modules/connected-organization"
  connected_tenant_domain_name = var.external_tenant_domain_name
}

/* Create access catalog for Entra ID Administration */
module "catalog" {
  source           = "./modules/access-catalog"
  name             = "Demo catalog"
  description      = "Catalog for Entra ID Administration access packages"
  external_catalog = true
  catalog_owner_id = data.azuread_user.tjs.object_id
}

/* Create access package for Global Administrator role */
module "global_admin" {
  source                           = "./modules/access-package"
  catalog_id                       = module.catalog.catalog_id
  display_name                     = "Global Administrator Access"
  description                      = "Global Administrator role in Entra ID"
  backup_approvers_group_object_id = module.catalog.backup_approvers_group_object_id
}

module "global_admin_role_policy" {
  source                       = "./modules/entraid-pim-role-policy"
  role_name                    = "Global Administrator"
  user_activation_max_duration = "PT1H"
}

/* Create group for users with access to global administrator role */
resource "msgraph_resource" "global_admins" {
    url = "groups"
    body = {
        displayName       = "PIM Global Admin role"
        description        = "Grant access to Global Administrator role via PIM"
        mailEnabled = false
        mailNickname = "pimglobaladmins"
        securityEnabled   = true
        isAssignableToRole = true
    }
    response_export_values = {
      all = "@"
    }
}
/* assign group access to global administrator role via PIM */
resource "azuread_directory_role_eligibility_schedule_request" "global_admin" {
  role_definition_id = module.global_admin_role_policy.id
  principal_id       = msgraph_resource.global_admins.output.all.id
  directory_scope_id = "/"
  justification      = "demo"
}

/* Associate group with access catalog and access package */
module "global_admin_assoc" {
  source            = "./modules/group-access-package-association"
  catalog_id        = module.catalog.catalog_id
  access_package_id = module.global_admin.access_package_id
  group_object_id   = msgraph_resource.global_admins.output.all.id
}