data "msgraph_resource" "role" {
  url = "roleManagement/directory/roleDefinitions"
  query_parameters = {
    "$filter" = ["displayName eq '${var.role_name}'"]
  }
  response_export_values = {
    id = "value[0].id"
  }
}

data "msgraph_resource" "role_assignment_policy" {
  url = "policies/roleManagementPolicyAssignments"
  query_parameters = {
    "$filter" = ["scopeId eq '/' and scopeType eq 'DirectoryRole' and roleDefinitionId eq '${data.msgraph_resource.role.output.id}'"]
  }
  response_export_values = {
    policy_id = "value[0].policyId"
  }
}

resource "msgraph_update_resource" "policy_rules" {
  url = "policies/roleManagementPolicies/${data.msgraph_resource.role_assignment_policy.output.policy_id}"
  body = {
    rules = [
      {
        "@odata.type"   = "#microsoft.graph.unifiedRoleManagementPolicyExpirationRule"
        id              = "Expiration_EndUser_Assignment"
        maximumDuration = var.user_activation_max_duration
      },
      {
        "@odata.type" = "#microsoft.graph.unifiedRoleManagementPolicyEnablementRule",
        id            = "Enablement_EndUser_Assignment",
        enabledRules = [
          "MultiFactorAuthentication",
          "Justification"
        ],
      },
      {
        "@odata.type"        = "#microsoft.graph.unifiedRoleManagementPolicyExpirationRule"
        id                   = "Expiration_Admin_Eligibility"
        isExpirationRequired = false
      },
      {
        "@odata.type"   = "#microsoft.graph.unifiedRoleManagementPolicyExpirationRule"
        id              = "Expiration_Admin_Assignment"
        maximumDuration = "P15D"
      }
    ]
  }
}