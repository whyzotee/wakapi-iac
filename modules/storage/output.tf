output "gcloud_storage_start_script_url" {
  value       = "${google_storage_bucket.bucket.url}/${var.startup_script}"
  description = "Script in google storage path."
}
