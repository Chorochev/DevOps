// Variables
variable "subscription_id" {
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
  description = "Subscription id"
}

variable "tenant_id" {
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
  description = "Tenant id"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "location" {
  type        = string
  description = "Region"
}
