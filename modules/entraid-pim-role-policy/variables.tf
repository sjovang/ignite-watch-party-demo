variable "role_name" {
  description = "The Entra ID role to modify the assignment policy for"
  type        = string
}

variable "user_activation_max_duration" {
  description = "The maximum duration a user can activate the role for. e.g. PT8H for 8 hours"
  type        = string
  default     = "PT8H"
}