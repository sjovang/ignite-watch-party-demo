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

/* Create access package for Global Administrator role */

/* Modify policy rules for the Global Administrator role */

/* Create group for users with access to global administrator role */

/* assign group access to global administrator role via PIM */

/* Associate group with access catalog and access package */

/* Create access catalog for Entra ID Administration */
