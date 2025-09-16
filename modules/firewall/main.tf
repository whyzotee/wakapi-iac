resource "google_compute_firewall" "wakapi_allow_http_icmp" {
  name    = "wakapi-allow-http-icmp"
  network = var.wakapi_vpc_network

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "default_allow_http_icmp" {
  name    = "default-allow-http-icmp"
  network = var.default_network

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
