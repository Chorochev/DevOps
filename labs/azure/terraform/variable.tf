// Variables
variable "subscription_id" {
  type        = string
  default     = "00000000-0000-0000-0000-000000000000"
  description = "Subscription id"
}

variable "location" {
  type        = string
  default     = "East Asia"
  description = "Region"
}

variable "qa_resource_group_name" {
  type        = string
  default     = "rg-lab-qa-eastasia-001"
  description = "The resource group name of QA"
}

variable "qa_virtual_network_name" {
  type        = string
  default     = "net-lab-qa-eastasia-001"
  description = "The virtual network name of QA"
}
