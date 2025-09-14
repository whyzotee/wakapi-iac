variable "network_default" {
  type        = string
  description = "default network url"
}

variable "wakapi_vpc_id" {
  type        = string
  description = "Wakapi VPC id"
}

variable "wakapi_vpc_self_link" {
  type        = string
  description = "Wakapi VPC self link"
}

variable "wakapi_vpc_subnet" {
  type        = string
  description = "Wakapi VPC subnet"
}

variable "startup_script_url" {
  type        = string
  description = "gs path to startup script"
}

variable "service_account" {
  type        = string
  description = "Google Service Account email."
}
