data "msgraph_resource" "external_tenant_id" {
  url = "tenantRelationships/findTenantInformationByDomainName(domainName='${var.connected_tenant_domain_name}')"
  response_export_values = {
    default_domain_name = "defaultDomainName"
    display_name        = "displayName"
    tenant_id           = "tenantId"
  }
}

resource "msgraph_resource" "connected_organization" {
  url = "identityGovernance/entitlementManagement/connectedOrganizations"
  body = {
    displayName = data.msgraph_resource.external_tenant_id.output.display_name
    description = format(
      "Connected organization for tenant %s (%s)",
      data.msgraph_resource.external_tenant_id.output.display_name,
      data.msgraph_resource.external_tenant_id.output.default_domain_name
    )
    identitySources = [
      {
        "@odata.type" = "#microsoft.graph.azureActiveDirectoryTenant"
        tenantId      = data.msgraph_resource.external_tenant_id.output.tenant_id
      }
    ]
    state = "configured"
  }
  response_export_values = {
    id = "id"
  }
}