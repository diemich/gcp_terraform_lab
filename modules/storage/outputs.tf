output "remote_backend_bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.bucket
}