output "wakapi_health_check_id" {
  value       = google_compute_health_check.wakapi_health_check.id
  description = "Wakapi health check id."
}
