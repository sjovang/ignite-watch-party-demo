resource "azuread_access_package_catalog" "this" {
  display_name       = var.name
  description        = var.description
  externally_visible = var.external_catalog
  published          = true
}

data "azuread_client_config" "current" {}

resource "msgraph_resource" "backup_approvers" {
    url = "groups"
    body = {
        displayName       = "${var.name} Catalog backup approvers"
        description        = "Backup approver group for access catalog ${var.name}"
        mailEnabled = false
        mailNickname = "${lower(replace(var.name, "/[-\\s]/", ""))}bkpapprovers"
        securityEnabled   = true
    }
    response_export_values = {
      all = "@"
    }
}

data "azuread_access_package_catalog_role" "catalog_owner" {
  display_name = "Catalog owner"
}

resource "azuread_access_package_catalog_role_assignment" "catalog_owner" {
  role_id             = data.azuread_access_package_catalog_role.catalog_owner.object_id
  principal_object_id = var.catalog_owner_id
  catalog_id          = azuread_access_package_catalog.this.id
}