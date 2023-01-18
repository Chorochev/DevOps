//////////////
// Variables
//////////////

variable "location" {
  type        = string  
  description = "Region"
}

variable "environment" {
  type = string
  description = "The environment like dev, qa, prod etc.."
}

variable "address_space" {
  type = list(string)
}

variable "workload" {
  type = string  
}

variable "instance" {
  type = string  
  default = "001"
}
