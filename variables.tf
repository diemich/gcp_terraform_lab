variable "project_id" {
    description = "Your project ID."
    default     = "n_project"
}
variable "gcp_region" {
    description = "Working region for this project."
    default     = "n_region"
}
variable "gcp_zone" {
    description = "Selected zone for this project."
    default     = "n_zone"
}
variable "bucket_name" {
  description = "Name of the buckets to create."
  type        = string
  default     = "FILL IN A (UNIQUE) BUCKET NAME HERE"
}