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
