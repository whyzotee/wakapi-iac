
output "unmig_instance_group" {
  value       = google_compute_instance_group.unmanaged.self_link
  description = "value"
}

output "wakapi_mig_instance_group" {
  value       = google_compute_instance_group_manager.wakapi_mig.instance_group
  description = "value"
}
