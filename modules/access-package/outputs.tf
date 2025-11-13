output "access_package_id" {
  description = "The access package ID"
  value       = azuread_access_package.this.id
}

output "primary_approvers_group_id" {
  description = "The Entra ID group created to hold the primary approvers for this access package"
  value       = azuread_group.primary_approvers.id
}