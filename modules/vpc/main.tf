resource "google_compute_subnetwork" "wakapi_subnet" {
  name          = "wakapi-subnetwork"
  ip_cidr_range = "10.2.0.0/20"
  region        = "us-west1"
  network       = google_compute_network.wakapi_network.id
}

resource "google_compute_network" "wakapi_network" {
  name                    = var.wakapi_network_name
  auto_create_subnetworks = true
}
