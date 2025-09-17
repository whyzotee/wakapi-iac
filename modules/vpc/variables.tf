variable "region" {
  type        = string
  description = "VPC region."
}

variable "default_network" {
  type        = string
  description = "Default network url."
}

variable "wakapi_network_name" {
  type        = string
  description = "Name of VPC/"
  default     = "wakapi-network"
}

variable "wakapi_ip_cidr_range" {
  type        = string
  description = "Range of ip that use in vpc subnet."
  default     = "10.2.0.0/20"
}
