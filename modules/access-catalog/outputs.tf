output "catalog_id" {
  value = azuread_access_package_catalog.this.id
}

output "backup_approvers_group_object_id" {
  value = azuread_group.backup_approvers.object_id
}