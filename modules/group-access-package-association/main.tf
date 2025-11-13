resource "azuread_access_package_resource_catalog_association" "this" {
  catalog_id             = var.catalog_id
  resource_origin_id     = var.group_object_id
  resource_origin_system = "AadGroup"
}

resource "azuread_access_package_resource_package_association" "this" {
  access_package_id               = var.access_package_id
  catalog_resource_association_id = azuread_access_package_resource_catalog_association.this.id
  access_type                     = var.access_type
}