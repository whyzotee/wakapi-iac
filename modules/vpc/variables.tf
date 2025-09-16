variable "default_network" {
  type        = string
  description = "default network url"
}

variable "wakapi_network_name" {
  type        = string
  description = "Name of VPC"
  default     = "wakapi-network"
}
