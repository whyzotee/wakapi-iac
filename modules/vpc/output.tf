output "wakapi_vpc_id" {
  value       = google_compute_network.vpc_network.id
  description = "VPC Network id."
}

output "wakapi_vpc_self_link" {
  value       = google_compute_network.vpc_network.self_link
  description = "VPC Network self link."
}

output "wakapi_vpc_subnet" {
  value       = google_compute_subnetwork.wakapi_subnet.id
  description = "VPC Subnetwork."
}
