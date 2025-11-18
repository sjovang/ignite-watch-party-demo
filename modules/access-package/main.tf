resource "azuread_access_package" "this" {
  catalog_id   = var.catalog_id
  display_name = var.display_name
  description  = var.description
}

data "azuread_client_config" "current" {}

resource "msgraph_resource" "primary_approvers" {
    url = "groups"
    body = {
        displayName       = "${var.display_name} Primary approvers"
        description        = "Primary approver group for access package ${var.display_name}"
        mailEnabled = false
        mailNickname = "${lower(replace(var.display_name, "/[-\\s]/", ""))}approvers"
        securityEnabled   = true
    }

    response_export_values = {
      all = "@"
    }
}

resource "azuread_access_package_assignment_policy" "this" {
  access_package_id = azuread_access_package.this.id
  display_name      = "${var.display_name} policy"
  description       = "Assignment policy for ${var.display_name}"
  duration_in_days  = 365
  extension_enabled = true

  approval_settings {
    approval_required                = true
    approval_required_for_extension  = false
    requestor_justification_required = true

    approval_stage {
      alternative_approval_enabled        = true
      approval_timeout_in_days            = 14
      enable_alternative_approval_in_days = 7

      alternative_approver {
        backup       = true
        object_id    = var.backup_approvers_group_object_id
        subject_type = "groupMembers"
      }

      primary_approver {
        object_id    = msgraph_resource.primary_approvers.output.all.id
        subject_type = "groupMembers"
      }
    }
  }

  assignment_review_settings {
    access_recommendation_enabled  = true
    access_review_timeout_behavior = "removeAccess"
    duration_in_days               = 30
    enabled                        = true
    review_frequency               = "quarterly"
    review_type                    = "Self"
  }

  requestor_settings {
    requests_accepted = true
    scope_type        = "AllConfiguredConnectedOrganizationSubjects"
  }
}