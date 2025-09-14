resource "google_compute_firewall" "wakapi_allow_http" {
  name    = "wakapi-allow-http-icmp"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "default_allow_http" {
  name    = "default-allow-http-icmp"
  network = var.network_default

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_subnetwork" "wakapi_subnet" {
  name          = "wakapi-subnetwork"
  ip_cidr_range = "10.2.0.0/20"
  region        = "us-west1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = true
}
