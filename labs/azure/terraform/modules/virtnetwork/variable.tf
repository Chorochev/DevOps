//////////////
// Variables
//////////////

variable "location" {
  type        = string
  description = "Region"
}

variable "environment" {
  type        = string
  description = "The environment like dev, qa, prod etc.."
}

variable "net_address_space" {
  type        = list(string)
  description = "A virtual network IP address space."
}

variable "workload" {
  type        = string
  description = "Workload/Application"
}

variable "instance" {
  type        = string
  default     = "001"
  description = "Instance"
}

variable "subnet_count" {
  type        = number
  default     = 1
  description = "The subnet count"
}

variable "subnet_types" {
  type        = list(string)
  description = "The subnet types (private/public)"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  description = "The subnet addresses"
}

variable "firewall" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

  description = "The set of network rules."
}
