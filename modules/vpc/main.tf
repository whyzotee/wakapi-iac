resource "google_compute_subnetwork" "wakapi_subnet" {
  name          = "wakapi-subnetwork"
  ip_cidr_range = var.wakapi_ip_cidr_range
  region        = var.region
  network       = google_compute_network.wakapi_network.id
}

resource "google_compute_network" "wakapi_network" {
  name                    = var.wakapi_network_name
  auto_create_subnetworks = true
}
