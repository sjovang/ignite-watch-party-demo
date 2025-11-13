resource "azuread_access_package_catalog" "this" {
  display_name       = var.name
  description        = var.description
  externally_visible = var.external_catalog
  published          = true
}

data "azuread_access_package_catalog_role" "catalog_owner" {
  display_name = "Catalog owner"
}

data "azuread_client_config" "current" {}

resource "azuread_group" "backup_approvers" {
  display_name = "catalog-backup-approvers-${var.name}"
  description  = "Backup approver group for access catalog ${var.name}"
  owners = [
    data.azuread_client_config.current.object_id
  ]
  security_enabled = true
}

resource "azuread_access_package_catalog_role_assignment" "catalog_owner" {
  role_id             = data.azuread_access_package_catalog_role.catalog_owner.object_id
  principal_object_id = azuread_group.backup_approvers.object_id
  catalog_id          = azuread_access_package_catalog.this.id
}