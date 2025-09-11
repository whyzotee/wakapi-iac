variable "bucket_name" {
  type        = string
  description = "Name of storage bucket"
  default     = "wakapi-bucket"
}

variable "bucket_location" {
  type        = string
  description = "Location of storage bucket"
  default     = "US"
}

variable "bucket_class" {
  type        = string
  description = "Class of storage bucket eg. 'STANDARD', 'NEARLINE', 'COLDLINE' or 'ARCHIVE'"
  default     = "STANDARD"
}

variable "startup_script" {
  type        = string
  description = "Path to script file"
  default     = "startup.sh"
}
