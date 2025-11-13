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
module "entraid_admin" {
  source           = "./modules/access-catalog"
  name             = "Entra ID Administration"
  description      = "Catalog for Entra ID Administration access packages"
  external_catalog = true
  catalog_owner_id = data.azuread_user.tjs.object_id
}

/* Create access package for Global Administrator role */
module "global_admin" {
  source                           = "./modules/access-package"
  catalog_id                       = module.entraid_admin.catalog_id
  display_name                     = "Global Administrator Access"
  description                      = "Global Administrator role in Entra ID"
  backup_approvers_group_object_id = module.entraid_admin.backup_approvers_group_object_id
}

/* Modify policy rules for the Global Administrator role */
module "global_admin_role_policy" {
  source                       = "./modules/entraid-pim-role-policy"
  role_name                    = "Global Administrator"
  user_activation_max_duration = "PT1H"
}

/* Create group for users with access to global administrator role */
resource "azuread_group" "global_admins" {
  display_name       = "PIM Global Admin role"
  description        = "Grant access to Global Administrator role via PIM"
  security_enabled   = true
  assignable_to_role = true
}

/* assign group access to global administrator role via PIM */
resource "azuread_directory_role_eligibility_schedule_request" "global_admin" {
  role_definition_id = module.global_admin_role_policy.id
  principal_id       = azuread_group.global_admins.object_id
  directory_scope_id = "/"
  justification      = "demo"
}

/* Associate group with access catalog and access package */
module "global_admin_assoc" {
  source            = "./modules/group-access-package-association"
  catalog_id        = module.entraid_admin.catalog_id
  access_package_id = module.global_admin.access_package_id
  group_object_id   = azuread_group.global_admins.object_id
}
