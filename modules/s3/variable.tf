variable "bucket_name" {
  description = "Base name for the S3 bucket (will be suffixed)"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = false
}
variable "owner" {
  description = "Owner tag"
  type        = string
  default     = "Percia"
}


variable "environment" {
  description = "Environment tag for the S3 bucket"
  type        = string
  default     = "development"
}