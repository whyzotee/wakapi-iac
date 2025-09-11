output "wakapi_vpc_id" {
  value       = google_compute_network.vpc_network.id
  description = "VPC Network id."
}
