variable "wakapi_health_check_id" {
  type        = string
  description = "Id of Health Check."
}

variable "wakapi_mig_group" {
  type        = string
  description = "Group of wakapi management group."
}

variable "unmig_group" {
  type        = string
  description = "Self link unmanaged group."
}
