variable "network_default" {
  type        = string
  description = "default network url"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC"
  default     = "wakapi-network"
}
