variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "external_catalog" {
  type    = bool
  default = false
}

variable "catalog_owner_id" {
  type = string
}